# Color variables
#A script can use escape sequences to produce colored text on the terminal. Colors for text are represented by color codes,
#including, reset = 0, black = 30, red = 31, green = 32, yellow = 33, blue = 34, magenta = 35, cyan = 36, and white = 37.
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
# Clear the color after that
clear='\033[0m'
#bold colors
bld_red='\033[1;31m'
bld_green='\033[1;32m'
bld_yellow='\033[2;33m'
bld_blue='\033[1;34m'
bld_magenta='\033[1;35m'
bld_cyan='\033[1;36m'
bld_white='\033[1;37m'
#background colors
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'
#text bold
bold=`tput bold`
offbold=`tput rmso`
#Frappe, pronounced fra-pay, is a full stack, batteries-included, web framework written in Python and Javascript with MariaDB as the database.
#It is the framework which powers ERPNext. It is pretty generic and can be used to build database driven apps.
#The key difference in Frappe compared to other frameworks is that meta-data is also treated as data and is used to build front-ends very easily.
#We believe in a monolithic architecture, so Frappe comes with almost everything you need to build a modern web application.
#It has a full featured Admin UI called the Desk that handles forms, navigation, lists, menus, permissions, file attachment and much more out of the box.
printf  "${green}Entering the Script file...${clear}\n"
#The sudo apt-get update command is used to download package information from all configured sources.
#The sources often defined in the /etc/apt/sources. list file and other files located in /etc/apt/sources.
#First, update your Ubuntu server to the latest version
sudo apt-get update -y
sudo apt-get upgrade -y
#Once your system is up-to-date, restart the system
#Before starting, you will need to install Apache, PHP, MySQL and other PHP libraries on your system
printf "${yellow}Installaing Resources...${clear}\n"
sudo apt-get -y install apache2 apache2-bin apache2-data apache2-mpm-prefork libaio1 libapache2-mod-php5 libapr1 libaprutil1 libdbd-mysql-perl libdbi-perl libhtml-template-perl libmysqlclient18 libterm-readkey-perl libwrap0 ssl-cert tcpd
sudo apt-get -y install mysql-server-8.0
sudo apt-get -y install unzip
sudo apt install PHP
#Once installation is complete, start Apache and MariaDB and enable them to start on boot time
printf "${yellow}Restarting Server and Database...${clear}\n"
sudo systemctl start apache2
sudo systemctl enable apache2
sudo systemctl start mysql
sudo systemctl enable mysql
#You will need to secure MariaDB
sudo mysql -uroot -p << EOF
alter user root@localhost identified by 'Booked@123';
create database bookeddb;
create user booked@localhost identified by 'Booked@DB';
grant all privileges on bookeddb.* to booked@localhost identified by 'Booked@DB';
flush privileges;.
exit;
EOF
printf "${green}\nMysql root user passowrd:${clear}${bg_blue}Booked@123${clear}\n"
printf "${green}\nMysql booked user passowrd:${clear}${bg_blue}Booked@DB${clear}\n"
#unzip the zip file
printf "${yellow}Unzipping project file${clear}\n"
sudo  unzip booked-2.8.5.zip
#move the booked directory to the apache web root directory
sudo mv -r booked /var/www/html/
#Change ownership of the booked directory to the www-data user and group.
sudo chown -R www-data:www-data /var/www/html/booked
#First remove the old config file
sudo rm -rf /etc/apache2/sites-available/booked.conf
#Configure Apache for Booked Scheduler
sudo cp -r booked.conf /etc/apache2/sites-available/
printf "${green} Site configuration setup completed...${clear}\n"
#Enable the site
printf "${yellow}Site Enabling...${clear}\n"
cd /etc/apache2/sites-available/
sudo a2ensite booked.conf
printf "${green}Site Enabled....${clear}\n"
#Restart the Apache service to read the new virtualhost configuration.
sudo service apache2 reload
#Copied project configuration
sudo cp -r config.php /var/www/html/booked/config/
#Next, import database schema and data.
cd /var/www/html/booked
#First import the create-schema
printf "${yellow}Required databases and data's importing... ${clear}\n\n"
mysql -u booked -p Booked@DB < database_schema/create-schema.sql
#Next, import the create-data
mysql -u booked -p Booked@DB < database_schema/create-data.sql
#Once the Booked Scheduler is configured
printf "${bold}${green}Book Scheduler Successfully Installed...${offbold}${clear}\n"
