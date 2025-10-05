# 🌍 IoT Environmental Sensor Data Analysis

## 📖 Project Overview
With the rise of smart environments, IoT sensors continuously capture real-time environmental data — including temperature, humidity, air quality, and motion.
This project focuses on analyzing sensor data to **monitor environmental conditions, detect anomalies, and visualize trends across multiple IoT devices**.

We use SQL for data cleaning and transformation, and Power BI to create an interactive multi-page dashboard highlighting key insights.

---

## 🛠️ Tools & Technologies
- **SQL Server (T-SQL)** → Data import, cleaning, transformation, and aggregation
- **Power BI** → Interactive dashboards and visualization
- **VS Code** → SQL scripting
- **GitHub** → Version control and portfolio hosting

---

## 🔎 Project Workflow
1. **Data Import**
   - Imported `environmental_sensor_data.csv` into SQL Server.
   - Created table `SensorData` with appropriate data types (`float`, `datetime`, `varchar`).
   - Verified consistency and integrity of timestamped readings.

2. **Data Cleaning (SQL)**
   - Converted incorrect data types to numeric.
   - Handled null values by replacing blanks or invalid readings with averages.
   - Standardized timestamp format for proper sorting and trend visualization.
   - Removed records with missing or corrupted sensor values.

3. **Feature Engineering (SQL)**
   - Created a Date column from the timestamp.
   - Added computed columns for:
     - `Temperature_Status` → (e.g., Normal, High, Critical)
     - `Air_Quality_Index` (based on CO₂ + Smoke + LPG readings)
   - Aggregated daily and device-wise statistics.

4. **Analysis (SQL)**
   - Calculated:
     - Average temperature, humidity, and CO₂ per device
     - Total motion events detected
     - Correlation between temperature and gas concentrations
     - Anomaly counts (unsafe readings > thresholds)

5. **Visualization (Power BI)**
   - Built a 4-page interactive dashboard displaying environmental trends, device insights, air quality, and anomaly detection.

---

## 📊 Dashboard Overview

### 1️⃣ Environmental Overview
![Environmental Overview](./PowerBI%20Dashboard/Environmental%20Overview.jpeg)

### 2️⃣ Device Insights
![Device Insights](./PowerBI%20Dashboard/Device%20Insights.jpeg)

### 3️⃣ Gas & Air Quality
![Gas & Air Quality](./PowerBI%20Dashboard/Gas%20&%20Air%20Quality.jpeg)

### 4️⃣ Motion & Anomalies
![Motion & Anomalies](./PowerBI%20Dashboard/Motion%20&%20Anomalies.jpeg)

---

## 💡 Key Insights
- 🌡️ **Temperature Stability:** Average temperature remains within safe range, but Device 3 records spikes above 35°C.
- 💨 **Air Quality:** CO₂ levels occasionally cross the 1000 ppm threshold — indicating ventilation issues.
- 💧 **Humidity:** Optimal humidity (40–60%) maintained across most devices.
- 🚶 **Motion Detection:** Motion frequency increases during working hours (08:00–20:00), implying active human presence.
- ⚠️ **Anomalies:** 3% of readings show unsafe CO₂ or temperature values — flagged for further investigation.

---

## 🚀 Future Improvements
- Integrate real-time IoT data streaming with **Power BI Service**.
- Apply **Python-based anomaly detection models** (e.g., Isolation Forest).
- Add an alert system when air quality exceeds thresholds.
- Expand to additional environmental sensors (noise, vibration, dust).

---

## 📌 Author
👤 **Aman Kumar Singh**  
📧 amankrsingh1831@gmail.com  
🔗 www.linkedin.com/in/aman-kumar-singh-3a3305387  

---
