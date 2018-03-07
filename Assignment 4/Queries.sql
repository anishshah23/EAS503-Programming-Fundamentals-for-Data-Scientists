# QUESTION 1
select count(year)/2700000
from crime_details
group by year;

# QUESTION 2
select * from crime_details cd2
inner join crime_incidents cd on cd.Crime_Id = cd2.Crime_Id
where cd2.Location_Description = 'SIDEWALK' and cd.Arrest ="TRUE";

# QUESTION 3 
select crime_types.primary_type, crime_incidents.district
from ((crime_types
join crime_details on crime_types.primary_type_id = crime_details.primary_type_id)
join crime_incidents on crime_details.crime_id = crime_incidents.crime_id)
where crime_details.location_description='sidewalk' and crime_incidents.arrest='true';



# QUESTION 4 Query 
select * from crime_incidents
where FBI_Code = 26 AND DOMESTIC = 'TRUE';

# QUESTION 5 Query 
select count(*) from crime_incidents cd
inner join crime_details cd2 on cd.Crime_Id = cd2.Crime_Id
inner join crime_types pd on cd2.Primary_Type_ID = pd.primary_type_id
where pd.primary_type = 'THEFT' and cd.Date > '2016-12-31';

# QUESTION 6 Query 
select pd.primary_type_id , count(cd2.Primary_Type_ID) 
from crime_details cd2 inner join crime_types pd on cd2.Primary_Type_ID = pd.primary_type_id 
where Block = '001XX N PARKSIDE AVE'
group by Primary_Type_ID order by count(cd2.Primary_Type_ID) DESC limit 3;

# QUESTION 7 
select  Avg(DATEDIFF(cd.Date, cd2.Updated_On))
from crime_incidents cd
inner join crime_details cd2
on cd.Crime_Id = cd2.Crime_Id;

# QUESTION 8 
select *  from crime_incidents cd
inner join crime_details cd2 on cd.Crime_Id = cd2.Crime_Id
where  CAST(cd.Date As DATE) = '2016-04-30'
and  CAST(cd2.Updated_On AS DATE) =  '2016-04-30';

# QUESTION 9
select * from crime_details cd2
inner join crime_incidents cd on cd.Crime_Id = cd2.Crime_Id
where cd2.Location_Description = 'STREET' and cd.Arrest = 'TRUE' and cd.Domestic = 'TRUE';

# QUESTION 10 
select * from crime_details cd2
inner join crime_incidents cd on cd.Crime_Id = cd2.Crime_Id
inner join crime_types pd on pd.primary_type = cd2.Primary_Type_ID where pd.primary_type_id = 'Telephone threats' and cd.FBI_Code = 30 and cd.District = 10;
