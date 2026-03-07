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

