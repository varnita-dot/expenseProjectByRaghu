log_message=/tmp/expense.log

echo download rpm file
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  >>$log_message


echo install node js
dnf install nodejs -y  >>$log_message

echo copy files
cp  backend.service  /etc/systemd/system/backend.service  >>$log_message

echo add user
useradd expense  >>$log_message

echo remove app
rm -rf /app  >>$log_message

echo make dir
mkdir /app  >>$log_message

echo download backend.zip
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip  >>$log_message

echo cd app
cd /app  >>$log_message

echo unzip
unzip /tmp/backend.zip  >>$log_message

echo app
cd /app  >>$log_message

echo install
npm install  >>$log_message

echo reload
systemctl daemon-reload  >>$log_message

echo backend start
systemctl enable backend  >>$log_message

echo start backend
systemctl start backend  >>$log_message

echo install mysql
dnf install mysql -y  >>$log_message

echo load pw
mysql -h sql.varraj20316.online -uroot -pExpenseApp@1 < /app/schema/backend. >>$log_message