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