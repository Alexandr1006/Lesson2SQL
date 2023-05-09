//1 задача

skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Alexandr', 'Popov', 'man', 28);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Sergey', 'Orlov', 'man', 40);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age)
skypro-# VALUES ('Elena', 'Ivanova', 'woman', 60);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Konstantin | Ivanov    | man    |  20
  2 | Petr       | Petrov    | woman  |  19
  4 | Alexandr   | Popov     | man    |  28
  5 | Sergey     | Orlov     | man    |  40
  6 | Elena      | Ivanova   | woman  |  60
(5 строк)

//2 задача

skypro=# SELECT first_name AS Имя, last_name AS Фамилия
skypro-# FROM employee
skypro-# ORDER BY Имя, Фамилия;
    Имя     | Фамилия
------------+---------
 Alexandr   | Popov
 Elena      | Ivanova
 Konstantin | Ivanov
 Petr       | Petrov
 Sergey     | Orlov
(5 строк)

//3 задача

skypro=# SELECT * FROM employee
skypro-# WHERE age < 30 OR age > 50;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Konstantin | Ivanov    | man    |  20
  2 | Petr       | Petrov    | woman  |  19
  4 | Alexandr   | Popov     | man    |  28
  6 | Elena      | Ivanova   | woman  |  60
(4 строки)

//4 задача

skypro=# SELECT * FROM employee
skypro-# WHERE age
skypro-# BETWEEN 30 AND 50;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  5 | Sergey     | Orlov     | man    |  40
(1 строка)

//5 задача

skypro=# SELECT * FROM employee
skypro-# ORDER BY last_name DESC;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  4 | Alexandr   | Popov     | man    |  28
  2 | Petr       | Petrov    | woman  |  19
  5 | Sergey     | Orlov     | man    |  40
  6 | Elena      | Ivanova   | woman  |  60
  3 | Konstantin | Ivanov    | man    |  20
(5 строк)

//6 задача

skypro=# SELECT * FROM employee
skypro-# WHERE first_name
skypro-# LIKE '_____%';
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Konstantin | Ivanov    | man    |  20
  4 | Alexandr   | Popov     | man    |  28
  5 | Sergey     | Orlov     | man    |  40
  6 | Elena      | Ivanova   | woman  |  60
(4 строки)

//7 задача

skypro=# UPDATE employee SET first_name = 'Konstantin', last_name = 'Petrov', gender = 'man', age = '19'WHERE id = 4;
UPDATE 1
skypro=# UPDATE employee SET first_name = 'Sergey', last_name = 'Popov', gender = 'man', age = '28'WHERE id = 2;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  3 | Konstantin | Ivanov    | man    |  20
  5 | Sergey     | Orlov     | man    |  40
  6 | Elena      | Ivanova   | woman  |  60
  4 | Konstantin | Petrov    | man    |  19
  2 | Sergey     | Popov     | man    |  28
(5 строк)

//8 задача

skypro=# SELECT first_name AS Имя,
skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
    Имя     | Суммарный_возраст
------------+-------------------
 Konstantin |                39
 Elena      |                60
 Sergey     |                68
(3 строки)

//9 задача

skypro=# SELECT * FROM employee
skypro-# WHERE age =(
skypro(# SELECT MIN(age)
skypro(# FROM employee
skypro(# );
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  4 | Konstantin | Petrov    | man    |  19
(1 строка)

//10 задача

skypro=# SELECT first_name, age
skypro-# FROM employee
skypro-# WHERE age =(
skypro(# SELECT MAX(age)
skypro(# FROM employee
skypro(# WHERE first_name = 'Konstantin') OR age =(SELECT MAX(age)
skypro(# FROM employee
skypro(# WHERE first_name = 'Sergey');
 first_name | age
------------+-----
 Konstantin |  20
 Sergey     |  40
(2 строки)