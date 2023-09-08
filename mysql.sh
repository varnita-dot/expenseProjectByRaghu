source common.sh

echo disable module
dnf module disable mysql -y &>>$log_message

echo copy repo
cp mysql.repo  /etc/yum.repos.d/mysql.repo &>>$log_message

echo install server
dnf install mysql-community-server -y &>>$log_message

echo enable server
systemctl enable mysqld &>>$log_message

echo start server
systemctl start mysqld &>>$log_message

echo installation
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$log_message

echo view password
mysql -uroot -pExpenseApp@1




