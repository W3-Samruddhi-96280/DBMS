/*2. Write a procedure that declares an integer variable called num, assigns 
a value to it, computes and inserts into the temp table the value of the 
variable itself, its square, and its cube.
*/

DROP PROCEDURE IF EXISTS Q2;

DELIMITER $$
CREATE PROCEDURE Q2(num INT)
BEGIN 
     DECLARE sq1 INT DEFAULT 0.0;
     DECLARE cube1 INT;
     
     SET sq1= num * num;
     SET cube1= num * num *num ;

     select sq1 as square,cube1 AS cube1;
     INSERT INTO temp VALUES(num,sq1,cube1);

END;
$$
DELIMITER ;

/*
SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q2.SQL
CALL Q2(7);

CREATE TABLE TEMP(
num INT,
square INT,
cube1 INT);




mysql> SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q2.SQL
Query OK, 0 rows affected, 1 warning (0.12 sec)


mysql> CALL Q2(7);
+--------+-------+
| square | cube1 |
+--------+-------+
|     49 |   343 |
+--------+-------+
1 row in set (0.00 sec)

Query OK, 1 row affected (0.09 sec)

mysql> SELECT * FROM TEMP;
+------+--------+-------+
| num  | square | cube1 |
+------+--------+-------+
|    7 |     49 |   343 |
+------+--------+-------+
1 row in set (0.00 sec)

*/