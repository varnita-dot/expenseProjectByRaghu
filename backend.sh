log_message=/tmp/expense.log
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  >>$log_message

dnf install nodejs -y  >>$log_message
cp  backend.service  /etc/systemd/system/backend.service  >>$log_message
useradd expense  >>$log_message
rm -rf /app  >>$log_message
mkdir /app  >>$log_message

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip  >>$log_message
cd /app  >>$log_message
unzip /tmp/backend.zip  >>$log_message

cd /app  >>$log_message
npm install  >>$log_message

systemctl daemon-reload  >>$log_message

systemctl enable backend  >>$log_message
systemctl start backend  >>$log_message

dnf install mysql -y  >>$log_message

mysql -h sql.varraj20316.online -uroot -pExpenseApp@1 < /app/schema/backend. >>$log_message