-- On our raws, data/time wasn't in the right format for Tableau so we change it form "%m/%d/%Y %H:%i:%s"
-- to "%Y/%m/%d %H:%i:%s" and export them for the visualisation



drop database if exists Uber;
create database Uber;
use Uber;

set global local_infile =1;

drop table if exists customer;

create table trip_apr (
    dt      text,
    lon     float,
    lat     float,
    Base    text
);

describe trip_apr;

truncate trip_apr;
#C:/Users/david/Desktop/ML/uber_tableau_challenge/uber-raw-data-apr14.csv

load data local infile 'C:/Users/david/Desktop/ML/uber_tableau_challenge/uber-raw-data-apr14.csv'
into table trip_apr
fields terminated by ','
lines terminated by '\n'
ignore 1 lines;

select *
from trip_apr;


update trip_apr
set dt = STR_TO_DATE(dt, "%m/%d/%Y %H:%i:%s");


select *
from trip_apr
INTO OUTFILE 'C:/Users/david/Desktop/ML/uber_tableau_challenge/Trip_apr.csv'
FIELDS TERMINATED BY ','  lines terminated by '\n' ;

## May

drop table if exists trip_may;
create table trip_may (
    dt      text,
    lon     float,
    lat     float,
    Base    text
);

describe trip_may;

truncate trip_may;
#C:/Users/david/Desktop/ML/uber_tableau_challenge/uber-raw-data-apr14.csv

load data local infile 'C:/Users/david/Desktop/ML/uber_tableau_challenge/uber-raw-data-may14.csv'
into table trip_may
fields terminated by ',' ENCLOSED BY '"'
lines terminated by '\n'
ignore 1 lines;

select *
from trip_may;


update trip_may
set dt = STR_TO_DATE(dt, "%m/%d/%Y %H:%i:%s");

## Jun

create table trip_jun (
    dt      text,
    lon     float,
    lat     float,
    Base    text
);

describe trip_jun;

truncate trip_jun;


load data local infile 'C:/Users/david/Desktop/ML/uber_tableau_challenge/uber-raw-data-jun14.csv'
into table trip_jun
fields terminated by ',' ENCLOSED BY '"'
lines terminated by '\n'
ignore 1 lines;

select *
from trip_jun;


update trip_jun
set dt = STR_TO_DATE(dt, "%m/%d/%Y %H:%i:%s");