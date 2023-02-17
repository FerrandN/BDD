insert into brands
(brand_name)
values
('Chevrolet'),
('Audi'),
('Toyota'),
('Peugeot'),
('AMC');

insert into owners
(owner_lastname, owner_firstname)
values
('Petit','Annie'),
('Marsfall','Bénédicte'),
('Doe','John'),
('Bouchra','Amine'),
('Jones','Steeven');


insert into cars
(car_id, car_name, car_registration, owner_id, brand_id)
values
('12','Chevelle Concours','AA-123-AA',1,1),
('16','A6 Break','BB-274-BB',5,2),
('21','Corolla','CA-789-BA',2,3),
('19','Monte Carlo','CC-546-FV',4,1),
('27','504','CG-274-ZG',4,4),
('30','Q8','ER-355-GX',3,2),
('28','100 LS','FV-313-FT',5,2),
('23','Hornet','DE-228-KS',5,5),
('26','3008','CF-614-PM',5,4),
('34','2008','BB-123-BB',1,4),
('33','208','AA-987-AA',1,4);