--use employees

/* 1. S�lectionner le nom, pr�nom et salaire de tous les employ�s tri�s par date 
d'embauche de la plus ancienne � la plus r�cente */

select
emp_lastname,
emp_firstname,
emp_salary,
emp_hiredate
from employees
order by emp_hiredate asc;

/* 2. s�lectionner le nom, salaire, date d'embauche de tous les employ�s tri�es
	par identifiant de manager (croissant) puis par nom (ordre alphab�tique). */

	select
	emp_lastname,
	emp_salary,
	emp_hiredate,
	emp_manager_id
	from employees
	order by emp_manager_id asc, emp_lastname asc;

/* 3. S�lectionner le nom, pr�nom, salaire, date d'embauche, nom et pr�nom du manager de tous les employ�s.
	Trier la liste par nom de manager (ordre croissant puis par date d'embauche de la plus
	r�cente � la plus ancienne. */

	select
	EMP1.emp_lastname,
	EMP1.emp_firstname,
	EMP1.emp_salary,
	EMP1.emp_hiredate,
	EMP1.emp_manager_id as 'manager id',
	MAN1.emp_lastname as 'manager first name',
	MAN1.emp_firstname as 'manager last name'
	from employees as EMP1
	join employees as MAN1 on EMP1.emp_manager_id = MAN1.emp_id;

/* 4. s�lectionner les employ�s sans manager*/

	select * from employees where emp_manager_id is null;

/* 5. s�lectionner le pr�nom et nom de tous les managers avec, pour chacun, le nombre de leurs subordonn�s.
	les managers avec le moins de subordonn�s apparaissent en 1er */

	select
	MAN1.emp_lastname,
	MAN1.emp_firstname,
	count(EMP1.emp_id) as 'manager_count'
	from employees as MAN1
	join employees as EMP1 on MAN1.emp_id = EMP1.emp_manager_id
	group by
	MAN1.emp_lastname,
	MAN1.emp_firstname
	order by
	manager_count asc;

/* 6. S�lectionner le nom de tous les managers avec, pour chacun,
	la moyenne des salaires de leur subordonn�s.
	Trier le r�sultat selon la valeur de la moyene par ordre croissant. */

	select
	MAN1.emp_lastname,
	MAN1.emp_firstname,
	avg(EMP1.emp_salary) as 'avg_salary'
	from employees as MAN1
	join employees as EMP1 on MAN1.emp_id = EMP1.emp_manager_id
	group by
	MAN1.emp_lastname,
	MAN1.emp_firstname
	order by
	avg_salary desc;

	/* 7 */
select
MAN1.emp_id,
MAN1.emp_lastname,
MAN1.emp_firstname,
MAN1.emp_salary,
MAN1.emp_hiredate,
MAN1.emp_manager_id,
count(EMP1.emp_id) as 'Number of employees',
avg(EMP1.emp_salary) as 'average salary',
sum(EMP1.emp_salary) as 'total salary'
from employees as MAN1 
join employees as EMP1 on EMP1.emp_manager_id IS NOT NULL
where MAN1.emp_manager_id is null
group by
MAN1.emp_id,
MAN1.emp_lastname,
MAN1.emp_firstname,
MAN1.emp_salary,
MAN1.emp_hiredate,
MAN1.emp_manager_id;

SELECT *
FROM employees;