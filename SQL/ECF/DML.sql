insert into products
(product_name, product_value)
values
('Ryzen 3 3200G', 124),
('Ryzen 3 4100',133),
('Ryzen 5 PRO',219),
('Ryzen 5 P5600',289),
('Ryzen 7 PR7 5700X',369),
('Ryzen 7 PR7 5800',579),
('Ryzen 9 PR7 5950X',759);

insert into production_lines
(line_id, line_label, product_id)
values
('R3A','Ryzen LEGACY',1),
('R3B','Ryzen MID',2),
('R5A','Ryzen PRO',3),
('R5B','Ryzen PRISM',4),
('R7A','Ryzen XCOM',5),
('R7B','Ryzen XD3',6),
('R9Z','Ryzen LATEST',7);

insert into production_done
(forge_date, forge_quantity, line_id, product_id)
values
('2022-04-29','27','R3A',1),
('2022-04-29','31','R5A',3),
('2022-05-02','34','R5A',3),
('2022-05-02','16','R5B',4);