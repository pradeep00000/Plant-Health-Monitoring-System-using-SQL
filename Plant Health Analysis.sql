create schema plant;
select * from plant.plant_health_data;

#1 . List all unique plant health statuses in the dataset.
select distinct Plant_Health_Status 
from plant.plant_health_data;

#2. Find the average soil moisture for all plants.
select avg(Soil_Moisture)
from plant.plant_health_data;

#3. Retrieve the data for plants under "High Stress".
select Plant_Health_Status
from plant.plant_health_data
where Plant_Health_Status = 'High Stress';

#4. Count the number of plants monitored.
select count(distinct Plant_ID) 
from plant.plant_health_data;

#5. Find the maximum light intensity recorded.
select max(Light_Intensity) 
from plant.plant_health_data;

#6. Calculate average chlorophyll content for each health status.
select  Plant_Health_Status , avg(Chlorophyll_Content)
from plant.plant_health_data
group by Plant_Health_Status;

#7. Find the top 3 timestamps with the highest nitrogen levels.
select Nitrogen_Level , 'timestamp'
from plant.plant_health_data
order by Nitrogen_Level desc
limit 3;

#8. Identify the plants with a Soil_pH greater than 7.
select Soil_pH
from plant.plant_health_data
where Soil_pH > 7;

#9. Find the plant with the highest average soil temperature.
select Plant_ID , avg(Soil_Temperature)
from plant.plant_health_data
group by Plant_ID
order by avg(Soil_Temperature) desc
limit 1;

#10. Calculate the total electrochemical signals for all "Moderate Stress" plants.
select sum(Electrochemical_Signal) , Plant_Health_Status
from plant.plant_health_data
where Plant_Health_Status = 'Moderate Stress';

#11. Identify time intervals when soil moisture was below 15 and light intensity was above 800.
select 'Timestamp' , Soil_Temperature , Light_Intensity
from plant.plant_health_data
where Soil_Moisture < 15 and Light_Intensity >800;

#12. Rank plants by their average nitrogen level and include ranks.
select Plant_ID , avg(Nitrogen_Level) , rank() over (order by avg(Nitrogen_Level) desc) as "Rank"
from plant.plant_health_data
group by Plant_ID;

#13. Find plants experiencing both "High Stress" and Soil_pH < 6.
select Soil_pH , Plant_Health_Status
from plant.plant_health_data
where Soil_pH < 6 and Plant_Health_Status = 'High Stress';

#14. Identify anomalies where Electrochemical_Signal > 1.9 but Health Status is "Healthy".
select Electrochemical_Signal , Plant_Health_Status
from plant.plant_health_data
where Electrochemical_Signal > 1.9 and Plant_Health_Status = "Healthy";

#15. Detect hourly trends in soil temperature.
select date(Timestamp) as Date , hour(Timestamp) as Hour , avg(Soil_Temperature)
from plant.plant_health_data
group by Date,Hour;

#16. Compare average chlorophyll content between "High Stress" and "Healthy" plants.
select Plant_Health_Status, avg(Chlorophyll_Content) as Avg_Chlorophyll
from plant.plant_health_data
where Plant_Health_Status in ('High Stress', 'Healthy')
group by Plant_Health_Status;