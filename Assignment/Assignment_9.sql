/*
Database Technologies – Assignment 9
Create appropriate indexes to solve the following problems. 
Note: use “sales” database to solve below queries.
-------------------------------------------------------------------------------------------------
1.Create an index that will enable a user to pull orders for
 ‘1990-10-03’ out of the Orders table quickly.
*/

mysql> CREATE index idx_order_odate
    -> ON orders(odate);
Query OK, 0 rows affected (1.20 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>
mysql> EXPLAIN FORMAT =JSON
    -> SELECT * FROM orders
    -> WHERE  odate = '1990-10-03';


"query_cost": "1.00"
    },
    "table": {
      "table_name": "orders",
      "access_type": "ref",
      "possible_keys": [
        "idx_order_odate"
      ],
      "key": "idx_order_odate",

mysql> SHOW INDEXES FROM orders;
+--------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name        | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| orders |          1 | idx_order_odate |            1 | odate       | A         |           2 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+-----------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
1 row in set (0.14 sec)


/*
2.If the Orders table has already been created, how can you force the
 onum field to be unique (assume all current values are unique)?
*/

[ALTER TABLE prders ADD CONSTRAINT uk_onum UNIQUE(onum);]



mysql> CREATE UNIQUE INDEX idx_order_onum
    -> ON orders(onum);
Query OK, 0 rows affected (0.69 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC orders;
+-------+--------------+------+-----+---------+-------+
| Field | Type         | Null | Key | Default | Extra |
+-------+--------------+------+-----+---------+-------+
| onum  | int          | YES  | UNI | NULL    |       |
| amt   | decimal(7,2) | YES  |     | NULL    |       |
| odate | date         | YES  | MUL | NULL    |       |
| cnum  | int          | YES  |     | NULL    |       |
| snum  | int          | YES  |     | NULL    |       |
+-------+--------------+------+-----+---------+-------+
5 rows in set (0.00 sec)


EXPLAIN FORMAT =JSON
SELECT onum FROM orders

| {
  "query_block": {
    "select_id": 1,
    "cost_info": {
      "query_cost": "1.25"
    },
    "table": {
      "table_name": "orders",
      "access_type": "index",
      "key": "idx_order_onum",
      "used_key_parts": [
        "onum"
      ],
      "key_length": "5",
      "rows_examined_per_scan": 10,
      "rows_produced_per_join": 10,
      "filtered": "100.00",
      "using_index": true,
      "cost_info": {
        "read_cost": "0.25",
        "eval_cost": "1.00",
        "prefix_cost": "1.25",
        "data_read_per_join": "240"
      },
      "used_columns": [
        "onum"
      ]
    }

/*
3.Create an index that would permit salesperson to retrieve his orders.
*/

EXPLAIN FORMAT = JSON
SELECT * FROM orders 
WHERE snum=1004;

"cost_info": {
      "query_cost": "1.25"
    },
    "table": {
      "table_name": "orders",
      "access_type": "ALL",


mysql> CREATE INDEX idx_orders_snum
    -> ON salespeople(snum);

Query OK, 0 rows affected (0.58 sec)
Records: 0  Duplicates: 0  Warnings: 0

/*
4.Let us assume that each salesperson is to have only one customer of a 
 given rating, and this is currently the case. Create an index that 
 enforces it.
*/



mysql> CREATE UNIQUE INDEX idx_customer_cnum_rating
    -> ON customers(cnum,rating);
Query OK, 0 rows affected, 1 warning (0.31 sec)
Records: 0  Duplicates: 0  Warnings: 1
mysql>
mysql> SHOW INDEXES FROM customers;
+-----------+------------+------------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table     | Non_unique | Key_name                     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-----------+------------+------------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| customers |          0 | idx_std_customer_cnum_rating |            1 | cnum        | A         |           7 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| customers |          0 | idx_std_customer_cnum_rating |            2 | rating      | A         |           7 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| customers |          0 | idx_customer_cnum_rating     |            1 | cnum        | A         |           7 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| customers |          0 | idx_customer_cnum_rating     |            2 | rating      | A         |           7 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-----------+------------+------------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.23 sec)







/*
5.Create an index to speed up searching order on a given date by given
customer
*/

mysql> SELECT odate,cnum
    -> FROM orders;
+------------+------+
| odate      | cnum |
+------------+------+
| 1990-10-03 | 2008 |
| 1990-10-03 | 2001 |
| 1990-10-03 | 2007 |
| 1990-10-03 | 2003 |
| 1990-10-03 | 2008 |
| 1990-10-04 | 2002 |
| 1990-10-04 | 2004 |
| 1990-10-04 | 2006 |
| 1990-10-04 | 2004 |
| 1990-10-04 | 2006 |
+------------+------+
10 rows in set (0.00 sec)


   -> ON orders(odate,cnum);
Query OK, 0 rows affected (0.43 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql>

 Table  | Non_unique | Key_name                     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+------------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| orders |          0 | idx_order_onum               |            1 | onum        | A         |          10 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| orders |          1 | idx_order_odate              |            1 | odate       | A         |           2 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| orders |          1 | idx_orders_odate_cnum_orders |            1 | odate       | A         |           2 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| orders |          1 | idx_orders_odate_cnum_orders |            2 | cnum        | A         |           7 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+--------+------------+------------------------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
4 rows in set (0.12 sec)

mysql>




