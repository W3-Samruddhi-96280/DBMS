/* PL SQL
1. Write a procedure that computes the perimeter and the area of a 
rectangle. Define your own values for the length and width. (Assuming 
that L and W are the length and width of the rectangle, 
Perimeter = 2*(L+W) and Area = L*W.
*/

DROP PROCEDURE IF EXISTS Q1;

DELIMITER $$
CREATE PROCEDURE Q1(length DOUBLE, width DOUBLE)
BEGIN 
     DECLARE P_RECT DOUBLE DEFAULT 0.0;
     DECLARE A_RECT DOUBLE ;

     SET P_RECT= 2*(length + width);
     SET A_RECT= length *width;

     SELECT P_RECT as Perimeter,A_RECT AS Area;
     INSERT INTO RESULT VALUES(P_RECT,A_RECT);
     
END;
$$
DELIMITER ;

/*
SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q1.SQL
CALL Q1(7,2);

mysql>  SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q1.SQL
Query OK, 0 rows affected (0.19 sec)

Query OK, 0 rows affected (0.08 sec)

mysql> CALL Q1(7,2);
+-----------+------+
| Perimeter | Area |
+-----------+------+
|        18 |   14 |
+-----------+------+
1 row in set (0.16 sec)

Query OK, 0 rows affected (0.16 sec)


CREATE TABLE RESULT(
Id INT,
Perimeter DOUBLE(8,2),
Area DOUBLE(8,2)
);

mysql> DESC RESULT;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| Id        | int         | YES  |     | NULL    |       |
| Perimeter | double(8,2) | YES  |     | NULL    |       |
| Area      | double(8,2) | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.04 sec)


*/


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


/*
3. Create a procedure to Convert a temperature in Fahrenheit (F) to its 
equivalent in Celsius (C) and vice versa. The required formulae are
C= (F-32) *5/9 F= 9/5*C + 32
*/
DROP PROCEDURE IF EXISTS Q3;

DELIMITER $$
CREATE PROCEDURE Q3(c DOUBLE ,F DOUBLE )
BEGIN 
    DECLARE num DOUBLE DEFAULT 0.0;
    SET c=  (F-32) *5/9 ;
    SET F= 9/5*C + 32 ;

    select c as Celsius,F AS Fahrenheit;
    INSERT INTO RESULT2 VALUES(c,F);


END;
$$
DELIMITER ;

/*
SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q3.SQL
CALL Q3(7.2);

CREATE TABLE RESULT2(
Celsius DOUBLE (9,2),
Fahrenheit DOUBLE(9,2)
);



mysql> CREATE TABLE RESULT2(
    -> Celsius DOUBLE (9,2),
    -> Fahrenheit DOUBLE(9,2)
    -> );
Query OK, 0 rows affected, 2 warnings (0.40 sec)

mysql> SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q3.SQL
Query OK, 0 rows affected (0.20 sec)

Query OK, 0 rows affected (0.07 sec)

Query OK, 0 rows affected (0.00 sec)


mysql> CALL Q3(7.2,8.2)
    -> ;
+---------------------+------------+
| Celsius             | Fahrenheit |
+---------------------+------------+
| -13.222222222222221 |        8.2 |
+---------------------+------------+
1 row in set (0.00 sec)

Query OK, 1 row affected (0.06 sec)

mysql> SELECT * FROM RESULT2;
+---------+------------+
| Celsius | Fahrenheit |
+---------+------------+
|  -13.22 |       8.20 |
+---------+------------+
1 row in set (0.00 sec)

mysql>

*/


/*
4. Create a procedure to Convert a number of inches into yards, feet, and 
inches. For example, 124 inches equals 3 yards, 1 foot, and 4 inches.
*/

DROP PROCEDURE IF EXISTS Q4;

DELIMITER $$
CREATE PROCEDURE Q4(IN inches DOUBLE)
BEGIN 
    DECLARE yards DOUBLE DEFAULT inches/36 ;
    DECLARE foot DOUBLE DEFAULT inches/12;

    SELECT CONCAT('Inches',inches,'are',yards,'Yards and',foot,'Foot') AS RESULT;
END;
$$
DELIMITER ;

/*
SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q4.SQL
CALL Q4(124);


mysql> SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q4.SQL
Query OK, 0 rows affected, 1 warning (0.27 sec)

Query OK, 0 rows affected (0.09 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> CALL Q4(124)
    -> ;
+---------------------------------------------------------------+
| RESULT                                                        |
+---------------------------------------------------------------+
| Inches124are3.4444444444444446Yards and10.333333333333334Foot |
+---------------------------------------------------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.03 sec)

*/



/*
Create a procedure to read two real numbers and tell whether the 
product of the two numbers is equal to or greater than 100
*/
DROP PROCEDURE IF EXISTS Q5;

DELIMITER $$
CREATE PROCEDURE Q5(IN num1 INT ,IN num2 INT,OUT num3 INT )
BEGIN 
    SET num3 = num1 * num2;
    
    IF num3 > 100 THEN 
        SELECT  "PRODUCT GREATER THAN 100" As msg;
    ELSE 
        SELECT "NOT GREATER THAN 100" As msg;
    END IF;
END;
$$
DELIMITER ;

/*
SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q5.SQL

-- SET @n1 = 10;
-- set @n2 = 20;
-- SET @res = 0;
-- CALL Q5(@n1,@n2,@res);


mysql> SOURCE E:/C-MC/DBMS/DBMS_Assignment/Assignment_10/Q5.SQL
Query OK, 0 rows affected, 1 warning (0.14 sec)

Query OK, 0 rows affected (0.13 sec)

Query OK, 0 rows affected (0.00 sec)

mysql> SET @n1 = 10;
Query OK, 0 rows affected (0.03 sec)

mysql> SET @n2 = 20;
Query OK, 0 rows affected (0.00 sec)

mysql> set @res =0;
Query OK, 0 rows affected (0.00 sec)


mysql> CALL Q5(@n1,@n2,@res);
+--------------------------+
| msg                      |
+--------------------------+
| PRODUCT GREATER THAN 100 |
+--------------------------+
1 row in set (0.00 sec)

*/




