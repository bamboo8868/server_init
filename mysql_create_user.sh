create user 'test'@'%' identified by '123456';
ALTER USER 'test'@'%' IDENTIFIED WITH mysql_native_password BY '123456';
GRANT ALL PRIVILEGES ON *.* TO 'test'@'%';
flush privileges;