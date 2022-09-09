1

Дано таблиці department і employee.
Знайдіть назву відділів та загальну суму коштів, яка витрачається на зарплату працівників. Відобразіть тількі ті відділи, у яких більше трьох працівників. Відсортуйте результат за сумою грошей у спадаючому порядку.
Результат повинен містити наступні колонки:
•	назву відділу: department_name
•	загальну суму грошей: amount_of_money
____________department__________
| id |    name      |  budget   |
| 1  | Marketing    | 200000    |
.................................
| 8  | Recruiting   | 750000    |

__________________________________employee______________________________
| id | first_name  | last_name   | department_id | hiring_date | salary |
| 1  | Steven      | King        | 1             | 2019-12-02  | 15000  |
.........................................................................
| 22 | Adam        | Fripp       | 8             | 2021-03-17  | 12000  |
•	
•	SELECT name AS department_name, SUM (salary) AS amount_of_money
•	FROM employee
•	INNER JOIN department
•	ON employee.department_id=department.id
•	
•	GROUP BY name
•	HAVING COUNT (first_name) > 3
•	ORDER BY amount_of_money DESC
•	 ;


DEPARTMENT_NAME	AMOUNT_OF_MONEY
IT	67000
Marketing	54500
Finance	45850

2

Дано таблицю staff:
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 8   | Yuriy      | Dyachuk   | male   | 1988-12-01 | head teacher | +380984805362 | 11100  | 2014-11-05     | NULL              |
Знайдіть середнє значення зарплати для кожної посади працівників, які досі працюють на роботі. Результат виводити лише у випадку, якщо середнє значення зарплати становить більше 10000.
Результат повинен містити наступні колонки: position, average_salary.


SELECT DISTINCT position, AVG (salary) AS average_salary
FROM staff
WHERE date_of_dismissal IS NULL
GROUP BY position
HAVING average_salary >10000 ;


POSITION	AVERAGE_SALARY
coordinator	11000
director	20000
head teacher	15000

3

Дано таблицю book:
____________________________________book_________________________________
| id  |	title                           | publish_year | number_of_pages| 
| 1   |	Functional Skills Maths Level 1	| 2009         | 232            | 
.........................................................................
| 10  | See Inside Your Body            | 2015         | 216            | 
Знайдіть, скільки сторінок було надруковано щороку в період з 2011 по 2015 рік включно, відсортуйте результат за роком у зворотному порядку.
Результат потрібно представити у вигляді:
•	перша колонка - year
•	друга колонка - number_of_pages
SELECT publish_year AS year, SUM (number_of_pages)  AS number_of_pages
FROM book
WHERE publish_year BETWEEN 2011 AND 2015
GROUP BY year
ORDER BY publish_year DESC;


YEAR	NUMBER_OF_PAGES
2015	216
2014	310
2012	652
2011	272

4

Дано таблицю pupil:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | +380967826174 | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | +380981458216 | Irpin |
Потрібно відобразити всю інформацію про трьох наймолодших учнів.
SELECT *
FROM pupil
 
ORDER BY birth_date DESC
LIMIT 3;

ID	FIRST_NAME	LAST_NAME	BIRTH_DATE	SEX	MOTHER_PHONE	FATHER_PHONE	CITY
11	Ksenia	Ilchenko	2013-04-21	female	+380987280371	+380503529175	Makariv
12	Bohdan	Pavlenko	2012-09-17	male	+380980198032	+380676269977	Vyshneve
9	Alla	Ilchuk	2010-08-23	female		+380981458216	Kyiv

5


Дано таблицю staff:
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 8   | Yuriy      | Dyachuk   | male   | 1988-12-01 | head teacher | +380984805362 | 11100  | 2014-11-05     | NULL              |
Потрібно відобразити список унікальних посад працівників із зарплатою понад 12000. Результат відсортуйте в алфавітному порядку.


SELECT DISTINCT position 
FROM staff
 WHERE salary>12000
ORDER BY  position;

POSITION
academic adviser
director
head teacher
teacher

6

Дано таблицю staff:
____________________________________staff__________________________________________________________________________________________
| id  |	first_name | last_name | sex    | birth_date | position     | phone         | salary | date_of_hiring | date_of_dismissal |
| 1   |	Stepan     | Shvets    | male   | 1990-05-07 | teacher      | +380984805362 | 7500   | 2013-07-01     | 2017-01-15        |
...................................................................................................................................
| 8   | Yuriy      | Dyachuk   | male   | 1988-12-01 | head teacher | +380984805362 | 11100  | 2014-11-05     | NULL              |
Знайдіть кількість нових працівників, які влаштовувались на роботу кожного року.
Результат повинен містити наступні колонки:
•	рік з колонки date_of_hiring: year
•	кількість працівників, які влаштувались на роботу в цей рік: number_of_staff


SELECT EXTRACT (YEAR FROM date_of_hiring) AS year, COUNT (first_name) AS number_of_staff
FROM staff
GROUP BY EXTRACT (YEAR FROM date_of_hiring);


YEAR	NUMBER_OF_STAFF
2012	1
2013	2
2014	3
2015	3
2016	1
2017	3
2018	2
2019	4

7

Дано таблицю pupil:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | +380967826174 | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | +380981458216 | Irpin |
Потрібно відобразити ім’я, прізвище, дату народження та місто учнів, яких звуть 'Eugen', 'Anna' або 'Volodymyr'.
SELECT first_name , last_name ,birth_date, city
FROM pupil
WHERE first_name IN ('Eugen', 'Anna', 'Volodymyr')  ;

FIRST_NAME	LAST_NAME	BIRTH_DATE	CITY
Eugen	Tsven	2000-12-01	Kyiv
Eugen	Fishin	2001-11-12	Kyiv
Anna	Ivaniuk	2002-01-19	Irpin
Anna	Sakulych	2001-10-13	Kyiv
Volodymyr	Symonenko	2008-03-14	

Дано таблицю pupil:
____________________________________pupil_____________________________________________________
| id  |	first_name | last_name | sex    | birth_date | mother_phone  | father_phone  | city  |
| 1   |	Eugen      | Tsven     | male   | 2000-12-01 | +380967826174 | +380998161172 | Kyiv  |
..............................................................................................
| 10  | Inna       | Kostenko  | female | 2009-10-15 | +380981865416 | +380981458216 | Irpin |
Потрібно відобразити ім’я, прізвище та дату народження учнів, чиє ім’я починається на 'A'.
SELECT first_name , last_name , birth_date
FROM pupil
WHERE first_name LIKE 'A%' ;

FIRST_NAME	LAST_NAME	BIRTH_DATE
Anna	Ivaniuk	2002-01-19
Anna	Sakulych	2001-10-13
Alla	Ilchuk	2010-08-23

8

Дано таблиці department і employee.
Відобразіть назву відділу та кількості працівників у кожному з відділів.
Результат повинен містити наступні колонки:
•	назву відділу: department_name
•	кількість праціників: number_of_employees
Примітки:
•	результат не повинен включати відділи, де немає працівників
•	не забудьте згрупувати результати по одному зі стовпців з вашого SELECT
•	це завдання можна виконати, не використовуючи сортування
____________department__________
| id |    name      |  budget   |
| 1  | Marketing    | 200000    |
.................................
| 8  | Recruiting   | 750000    |

__________________________________employee______________________________
| id | first_name  | last_name   | department_id | hiring_date | salary |
| 1  | Steven      | King        | 1             | 2019-12-02  | 15000  |
.........................................................................
| 22 | Adam        | Fripp       | 8             | 2021-03-17  | 12000  |


SELECT DISTINCT name AS department_name, COUNT (first_name) AS number_of_employees
FROM employee
INNER JOIN department
ON employee.department_id=department.id

GROUP BY name;

DEPARTMENT_NAME	NUMBER_OF_EMPLOYEES
Finance	4
Human Resources	3
IT	5
Marketing	4
Recruiting	2
Sales	3
Support	2


9

Дано таблиці department і employee.
Відобразіть назву відділу, середню заробітну плату та кількість працівників, що працюють у кожному з відділів.
Результат повинен містити наступні колонки:
•	назву відділу: department_name
•	середню зарплату працівників: average_salary
•	кількість працівників: number_of_employees
Примітки:
•	результат не повинен містити відділи, де немає працівників
•	не забудьте згрупувати результати по одному зі стовпців з вашого SELECT
•	це завдання можна виконати, не використовуючи сортування
____________department__________
| id |    name      |  budget   |
| 1  | Marketing    | 200000    |
.................................
| 8  | Recruiting   | 750000    |

__________________________________employee______________________________
| id | first_name  | last_name   | department_id | hiring_date | salary |
| 1  | Steven      | King        | 1             | 2019-12-02  | 15000  |
.........................................................................
| 22 | Adam        | Fripp       | 8             | 2021-03-17  | 12000  |


SELECT name AS department_name, AVG (salary) AS average_salary, COUNT (first_name) AS number_of_employees
FROM employee
INNER JOIN department
ON employee.department_id=department.id
 GROUP BY name;


DEPARTMENT_NAME	AVERAGE_SALARY	NUMBER_OF_EMPLOYEES
Finance	11462	4
Human Resources	15733	3
IT	13400	5
Marketing	13625	4
Recruiting	11500	2
Sales	12300	3
Support	15000	2
