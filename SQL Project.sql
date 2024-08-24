select * from classes.`car dekho`;

# Total car : to get a count total records
select count(*) from classes.`car dekho`;

select count(*) from classes.`car dekho` where  year=2023;
select count(*) from classes.`car dekho` where year in (2020);
select count(*) from classes.`car dekho` where year in (2021);
select count(*) from classes.`car dekho` where year in (2022); 

# Group by
select count(*) from classes.`car dekho` where year in (2020,2021,2022) group by  year;
select year,count(*) from classes.`car dekho` group by year;

select year,count(*) from classes.`car dekho` where fuel="Petrol";


select count(*) from  classes.`car dekho` where year= 2020 and fuel="diesel";

select year,count(*) from classes.`car dekho` where fuel="Petrol" group by year;
select year,count(*) from classes.`car dekho` where fuel="Diesel" group by year;
select year,count(*) from  classes.`car dekho` where fuel="Electric" group by year;
select year,count(*) from  classes.`car dekho` where fuel="CNG" group by year;

select year, count(*) from classes.`car dekho` group by year having count(*)>100;
select year, count(*) from classes.`car dekho` group by year having count(*)<50;


select count(*) from classes.`car dekho` where year between 2015 and 2023;

select * from classes.`car dekho` where year  between 2015 and 2023;


#end
