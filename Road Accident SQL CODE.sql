select * from road_data
SELECT SUM(number_of_casualties) AS CY_Casualties
FROM road_data
where YEAR(accident_date)='2022'

SELECT SUM(number_of_casualties) AS CY_Casualties
FROM road_data
where YEAR(accident_date)='2022' AND road_surface_conditions='Dry'

SELECT count(DISTINCT accident_index) AS CY_Accidents
FROM road_data
where YEAR(accident_date)='2022' AND road_surface_conditions='Dry'

SELECT SUM(number_of_casualties) AS CY_Fatal_Casualties
FROM road_data
where YEAR(accident_date)='2022' AND accident_severity='Fatal'

SELECT SUM(number_of_casualties) AS CY_Serious_Casualties
FROM road_data
where YEAR(accident_date)='2022' AND accident_severity='Serious'

SELECT SUM(number_of_casualties) AS CY_Slight_Casualties
FROM road_data
where YEAR(accident_date)='2022' AND accident_severity='Slight'

SELECT
      CASE
	      WHEN vehicle_type IN ('agricultural vehicle') THEN 'Agricultural'
		  WHEN vehicle_type IN ('Car','Taxi/Private hire car') THEN 'Car'
		  WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc','Pedal cycle') THEN 'Bike'
		  WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') THEN 'Bus'
		  WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t.','Van / Goods 3.5 tonnes mgw and under') THEN 'Van'
		  ELSE 'Other'
      END AS Vehicle_group,
	  SUM(number_of_casualties) as CY_Casualties
FROM road_data
WHERE YEAR(accident_date) = '2022'
GROUP BY
     CASE
	     WHEN vehicle_type IN ('agricultural vehicle') THEN 'Agricultural'
		  WHEN vehicle_type IN ('Car','Taxi/Private hire car') THEN 'Car'
		  WHEN vehicle_type IN ('Motorcycle 125cc and under','Motorcycle 50cc and under','Motorcycle over 125cc and up to 500cc','Motorcycle over 500cc','Pedal cycle') THEN 'Bike'
		  WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)','Minibus (8 - 16 passenger seats)') THEN 'Bus'
		  WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t.','Van / Goods 3.5 tonnes mgw and under') THEN 'Van'
		  ELSE 'Other'
     END
	 
select datename(MONTH,accident_date) AS Month_name ,SUM(number_of_casualties) as CY_Casulties
FROM road_data
where year(accident_date) = '2022'
group by datename(MONTH,accident_date)

SELECT road_type, sum(number_of_casualties) as CY_Casualties FROM road_data
WHERE YEAR(accident_date)='2022'
group by road_type

SELECT urban_or_rural_area, sum(number_of_casualties) as CY_Casualties FROM road_data
WHERE YEAR(accident_date)='2022'
group by urban_or_rural_area