echo installing nginx
dnf install nginx -y

cp  expense.conf /etc/nginx/default.d/expense.conf

echo enable and start nginx
systemctl enable nginx
systemctl start nginx

echo removed old content
rm -rf /usr/share/nginx/html/*

echo download frontend.zip
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo change the directory
cd /usr/share/nginx/html

echo unzip frontend.zip
unzip /tmp/frontend.zip

echo restart nginx
systemctl restart nginx

echo end of frontend