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
-- CALL sp5(@n1,@n2,@res);

*/