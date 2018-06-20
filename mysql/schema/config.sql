-- ALTER USER 'root'@'localhost' IDENTIFIED BY ''; -- cannot be accessed from outside of localhost. if server is compromised, database may as well be
-- CREATE USER 'crypto'@'localhost'; -- cannot be accessed from outside of localhost. if server is compromised, database may as well be
-- CREATE USER 'crypto' IDENTIFIED BY '6GeT2uODzNyZYPmS'; -- this account gets passworded because it can be accessed from anywhere
-- GRANT ALL PRIVILEGES ON *.* TO 'crypto' WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON backtests.* TO 'crypto' IDENTIFIED BY '6GeT2uODzNyZYPmS' WITH GRANT OPTION;



-- ALTER USER 'root'@'localhost' IDENTIFIED BY '';
-- CREATE USER 'root'@'localhost' IDENTIFIED BY '';
-- CREATE USER 'root'@'192.168.1.0/255.255.255.000' IDENTIFIED BY '';
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';
-- CREATE USER 'crypto'@'localhost' IDENTIFIED BY 'crypto';
-- RENAME USER 'root@192.168.1.115' TO 'root@192.168.1.0/255.255.255.000';
-- 
-- GRANT ALL PRIVILEGES ON `gekkoga` TO `root`@'%' WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON `gekkoga`.`*` TO `root`@`192.168.1.0/255.255.255.000` IDENTIFIED BY `` WITH GRANT OPTION;
-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '1234' WITH GRANT OPTION;

-- CREATE DATABASE backtests;