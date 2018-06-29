CREATE DATABASE IF NOT EXISTS backtests;
DROP USER IF EXISTS 'crypto';
DROP USER IF EXISTS 'crypt';
FLUSH PRIVILEGES;
CREATE USER 'crypt'@'192.168.1.%'; -- cannot be accessed from outside of local network. if network (firewall) is compromised, database may as well be
CREATE USER 'crypto' IDENTIFIED BY 'y9TxJd8LFmWFZ58p'; -- this account gets passworded because it can be accessed from anywhere
GRANT ALL PRIVILEGES ON *.* TO 'crypt'@'192.168.1.%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'crypto' IDENTIFIED BY 'y9TxJd8LFmWFZ58p' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON backtests.* TO 'crypt'@'192.168.1.%' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON backtests.* TO 'crypto' IDENTIFIED BY 'y9TxJd8LFmWFZ58p' WITH GRANT OPTION;
