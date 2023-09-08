log_message=/tmp/expense.log
dnf module disable mysql -y >>$log_message

cp mysql.repo  /etc/yum.repos.d/mysql.repo >>$log_message

dnf install mysql-community-server -y >>$log_message

systemctl enable mysqld >>$log_message
systemctl start mysqld >>$log_message

mysql_secure_installation --set-root-pass ExpenseApp@1 >>$log_message

mysql -uroot -pExpenseApp@1 >>$log_message

