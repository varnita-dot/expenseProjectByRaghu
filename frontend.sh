

echo installing nginx
dnf install nginx -y >>/tmp/expense.log

cp  expense.conf /etc/nginx/default.d/expense.conf >>/tmp/expense.log

echo enable and start nginx
systemctl enable nginx >>/tmp/expense.log
systemctl start nginx >>/tmp/expense.log

echo removed old content
rm -rf /usr/share/nginx/html/*   >>/tmp/expense.log

echo download frontend.zip
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip   >>/tmp/expense.log

echo change the directory
cd /usr/share/nginx/html  >>/tmp/expense.log

echo unzip frontend.zip
unzip /tmp/frontend.zip  >>/tmp/expense.log

echo restart nginx
systemctl restart nginx  >>/tmp/expense.log

echo end of frontend