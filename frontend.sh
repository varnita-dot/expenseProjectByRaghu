source common.sh
component=frontend

echo installing nginx
dnf install nginx -y &>>$log_message
extract_status

cp  expense.conf /etc/nginx/default.d/expense.conf &>>$log_message
extract_status

echo enable and start nginx
systemctl enable nginx &>>$log_message
systemctl start nginx &>>$log_message
extract_status

echo removed old content
rm -rf /usr/share/nginx/html/*   &>>$log_message
extract_status

download_and_extract


echo change the directory
cd /usr/share/nginx/html  &>>$log_message
extract_status



echo restart nginx
systemctl restart nginx  &>>$log_message
extract_status


echo end of frontend
