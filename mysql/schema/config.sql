CREATE DATABASE IF NOT EXISTS backtests;
DROP USER IF EXISTS 'crypto';
DROP USER IF EXISTS 'crypto'@'172.18.0.%';
DROP USER IF EXISTS 'crypto'@'localhost';
FLUSH PRIVILEGES;
CREATE USER 'crypto'@'localhost'; -- cannot be accessed from outside of localhost. if server is compromised, database may as well be
CREATE USER 'crypto'@'172.18.0.%';
CREATE USER 'crypto' IDENTIFIED BY 'y9TxJd8LFmWFZ58p'; -- this account gets passworded because it can be accessed from anywhere
GRANT ALL PRIVILEGES ON *.* TO 'crypto'@'172.18.0.%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'crypto' IDENTIFIED BY 'y9TxJd8LFmWFZ58p' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON backtests.* TO 'crypto'@'172.18.0.%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON backtests.* TO 'crypto' IDENTIFIED BY 'y9TxJd8LFmWFZ58p' WITH GRANT OPTION;
