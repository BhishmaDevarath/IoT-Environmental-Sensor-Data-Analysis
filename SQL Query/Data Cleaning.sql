-- Check for missing values
SELECT 
    SUM(CASE WHEN timestamp IS NULL THEN 1 ELSE 0 END) AS Missing_Timestamps,
    SUM(CASE WHEN temp IS NULL THEN 1 ELSE 0 END) AS Missing_Temperature,
    SUM(CASE WHEN humidity IS NULL THEN 1 ELSE 0 END) AS Missing_Humidity
FROM SensorData;

-- Remove any rows with NULL critical fields
DELETE FROM SensorData
WHERE timestamp IS NULL OR temp IS NULL OR humidity IS NULL;

-- Handle negative or impossible values
DELETE FROM SensorData
WHERE temp < -20 OR temp > 60
   OR humidity < 0 OR humidity > 100;

-- Optional: Round floating values for better readability
UPDATE SensorData
SET temp = ROUND(temp, 2),
    humidity = ROUND(humidity, 2),
    co2 = ROUND(co2, 2),
    lpg = ROUND(lpg, 2),
    smoke = ROUND(smoke, 2);

-- Overview of key metrics
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT device_id) AS Total_Devices,
    MIN(timestamp) AS Start_Date,
    MAX(timestamp) AS End_Date,
    AVG(temp) AS Avg_Temperature,
    AVG(humidity) AS Avg_Humidity,
    AVG(co2) AS Avg_CO2,
    AVG(lpg) AS Avg_LPG,
    AVG(smoke) AS Avg_Smoke
FROM SensorData;

--Hourly Averages (for time-based trends)
SELECT 
    DATEPART(HOUR, timestamp) AS HourOfDay,
    ROUND(AVG(temp), 2) AS Avg_Temp,
    ROUND(AVG(humidity), 2) AS Avg_Humidity,
    ROUND(AVG(co2), 2) AS Avg_CO2
FROM SensorData
GROUP BY DATEPART(HOUR, timestamp)
ORDER BY HourOfDay;

--Device-wise Statistics
SELECT
    device_id,
    COUNT(*) AS Total_Readings,
    ROUND(AVG(temp), 2) AS Avg_Temp,
    ROUND(AVG(humidity), 2) AS Avg_Humidity,
    ROUND(AVG(co2), 2) AS Avg_CO2
FROM SensorData
GROUP BY device_id
ORDER BY Avg_Temp DESC;

--Motion Detection Frequency
SELECT 
    device_id,
    SUM(CASE WHEN motion = 1 THEN 1 ELSE 0 END) AS Motion_Events,
    COUNT(*) AS Total_Readings,
    ROUND(SUM(CASE WHEN motion = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Motion_Percentage
FROM SensorData
GROUP BY device_id;

--Correlation-like Check: Temperature vs Gas Readings
SELECT
    ROUND(AVG(temp), 2) AS Avg_Temp,
    ROUND(AVG(co2), 2) AS Avg_CO2,
    ROUND(AVG(smoke), 2) AS Avg_Smoke,
    ROUND(AVG(lpg), 2) AS Avg_LPG
FROM SensorData;

--Anomaly Detection
SELECT *
FROM SensorData
WHERE co2 > (SELECT AVG(co2) + 3 * STDEV(co2) FROM SensorData)
   OR smoke > (SELECT AVG(smoke) + 3 * STDEV(smoke) FROM SensorData)
   OR temp > (SELECT AVG(temp) + 3 * STDEV(temp) FROM SensorData)
ORDER BY timestamp;
