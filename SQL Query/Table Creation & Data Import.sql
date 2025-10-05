CREATE DATABASE IoT_SensorData;
GO

USE IoT_SensorData;

CREATE TABLE SensorData (
    id INT PRIMARY KEY,
    timestamp TIMESTAMP,
    device_id NVARCHAR(50),
    co2 FLOAT,
    humidity FLOAT,
    light INT,
    lpg FLOAT,
    motion INT,
    smoke FLOAT,
    temp FLOAT
);

BULK INSERT SensorData
FROM 'D:\Downloads\iot_telemetry_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
    CODEPAGE = '65001'
);

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SensorData';
