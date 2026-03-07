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