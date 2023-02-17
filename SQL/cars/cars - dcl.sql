--1

select
car_registration,
car_name
from cars
order by car_registration asc;

--2
select
car_id,
car_name, 
car_registration,
owner_lastname,
owner_firstname,
brand_name
from cars
join owners on cars.owner_id = owners.owner_id
join brands on cars.brand_id = brands.brand_id
order by brand_name, owner_lastname;

--3
select
B1.brand_name,
count(car_name) as cars_number
from brands as B1
join cars on cars.brand_id = B1.brand_id
group by
brand_name;

--4
select
brand_name,
count(distinct owners.owner_id) as owners_number
from cars
join owners on owners.owner_id = cars.owner_id
join brands on cars.brand_id = brands.brand_id
group by
brand_name;

--5
select
owner_firstname
from owners
where
owner_firstname  like '[A]%'

--6
select
owners.owner_lastname,
owners.owner_firstname
from owners
where owner_firstname like '_____%';

--7
select
owners.owner_firstname,
owners.owner_lastname,
count(car_id) as cars_number
from owners
join cars on cars.owner_id = owners.owner_id
group by 
owners.owner_firstname,
owners.owner_lastname
having count(car_id)  > 1
order by
cars_number desc;

--8
select
owners.owner_firstname,
owners.owner_lastname,
brands.brand_name,
count(car_id) as cars_number,
count(brands.brand_name) as brand_number_of_cars
from cars
join owners on cars.owner_id = owners.owner_id
join brands on brands.brand_id = cars.brand_id
group by 
owners.owner_firstname,
owners.owner_lastname,
brands.brand_name
having
count(car_id) > 1;