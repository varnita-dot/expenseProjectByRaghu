source common.sh
component=frontend

echo installing nginx
dnf install nginx -y &>>$log_message

if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
exit 1
fi
cp  expense.conf /etc/nginx/default.d/expense.conf &>>$log_message
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
exit 1
fi

echo enable and start nginx
systemctl enable nginx &>>$log_message
systemctl start nginx &>>$log_message
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
exit 1
fi

echo removed old content
rm -rf /usr/share/nginx/html/*   &>>$log_message
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
exit 1
fi

download_and_extract

echo change the directory
cd /usr/share/nginx/html  &>>$log_message
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
exit 1
fi



echo restart nginx
systemctl restart nginx  &>>$log_message
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
exit 1
fi

echo end of frontend
if [ $? -eq 0 ]; then
  echo -e "\e[32mSUCCESS\e[0m"
  else
    echo -e "\e[31mFAILED\e[0m"
exit 1
fi