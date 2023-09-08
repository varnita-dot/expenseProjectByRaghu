source common.sh

echo installing nginx
dnf install nginx -y &>>$log_message
echo $?

cp  expense.conf /etc/nginx/default.d/expense.conf &>>$log_message
echo $?

echo enable and start nginx
systemctl enable nginx &>>$log_message
systemctl start nginx &>>$log_message
echo $?

echo removed old content
rm -rf /usr/share/nginx/html/*   &>>$log_message
echo $?

echo download frontend.zip
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip   &&>>$log_message
echo $?

echo change the directory
cd /usr/share/nginx/html  &>>$log_message
echo $?

echo unzip frontend.zip
unzip /tmp/frontend.zip  &>>$log_message
echo $?

echo restart nginx
systemctl restart nginx  &>>$log_message
echo $?

echo end of frontend
echo $?