# Write your MySQL query statement below
select patient_id ,
patient_name ,
conditions 
from Patients 
where conditions like '% DIAB100'
or conditions like 'DIAB100 %'
or conditions like '% DIAB100 %'
or conditions like '%DIAB100 %'
or conditions like 'DIAB100'
or conditions like 'DIAB101'
or conditions like 'DIAB101 %'
or conditions like '% DIAB101'
or conditions like '% DIAB101 %'
or conditions like '%DIAB101%'
order by patient_id;