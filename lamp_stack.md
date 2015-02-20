#LAMP stack/software bundle

LAMP stack is a group of open source software used to get Web servers up and running. 

LAMP is a suitable solutions stack for building dynamic websites and web applications.

Whilst the phrase became popular referring to Linux, Apache, MySQL and PHP, it now refers to a generic software stack model (but always consisting of an OS, Web Server, database and software (application programming) language). 

Lamp has been adapted to include other components, though typically consisting of free and open-source software. For example: 

* WAMP - the equivalent installation on a Microsoft Windows OS
* WIMP - interchange IIS for Apache
* MAMP - Macintosh
* SAMP - Solaris
* LEMP - replace Apache with lightweight web server Nginx
* PHP can be replaced by Perl or Python for example

LAMP acronym stands for: 

* Linux
* Apache (HTTP Server)
* MySQL (relational database management system)
* PHP (programming language)

This particular software combo became popular as it is entirely free and open source software. 

Apache is a free open source software which runs over 50% of the world's web servers

MySQL - a powerful database management system used for organising and retrieving data

PHP - open source web scripting language, widely used to build dynamic webpages. A server side scripting language designed for web development but also as a general purpose programming language.  

You can boost a LAMP bundle with other free and open-source software packages, such as monitoring, load balancing, security testing and intrusion detection packages. 

##High availability and load balancing

Specific solutions are required for websites that serve huge numbers of requests, or provide services that demand high uptime. 

These solutions might involve multiple web and database servers, combined with additional components (e.g. load balancers) that perform logical aggregation of resources provided by each of the servers, and which distribute the workload across multiple servers. 

For the aggregation of database servers, MySQL provides internal replication mechanisms which implement a master/slave relationship between the original database (master) and its copies (slaves).

High availability setups provide various forms of redundancy, meaning some servers can experience downtime without interrupting the service provided to users by a LAMP instance. 

Also, these redundancy setups allow for hardware failures that result in data loss on individual servers, without the collectively stored data actually becoming lost. 

#MAMP
Mamp is a very popular LAMP stack on MAC OS X platform. It's a one-click package solution for web developers to quickly set up a website development environment. It provides convenient buttons to start and stop Apache and MySQL, and you can easily switch between different PHP versions if your web application requires a specific PHP version. 

An installation of MAMP, with its own set of PHP, Apoache Server and MySQL database, provides a kind of sandbox environment. 

Can be some drawbacks though - e.g. where someone wanted to try out Ruby and Rails, but it wouldn't work with the MySQL that came with MAMP. 

And actually, even before installing MAMP, OSX has two components of LAMP stack already pre-installed - PHP and Apache, which have been sitting there idle. There seems little point in relying on MAMP and having redundant programs on the system. 

##Setting up a mostly native LAMP stack

<https://www.urbaninsight.com/2014/09/22/semi-native-lamp-stack-os-x>

You can set up a mostly native LAMP stack on OS X within half an hour. As OS X comes with PHP and an Apache server already pre-installed, more than half your job is done already. 

See <https://www.urbaninsight.com/2014/09/22/semi-native-lamp-stack-os-x> for all the commands that go with the instructions below. 

1. Verify that Apache is there and runnable. You need `sudo` command to run Apache, which asks for your password.
  
2.  Then if you visit `http://localhost` on your browser, and it should display 'it works!'

3. Now configure Apache at /etc/apache2/httpd.conf - `sudo subl /etc/apache2/httpd.conf`
n.b. subl stands for sublime text

So you configure Apache to enable PHP with the Apache Web server. 

4. You might also (optional) want to change the DocumentRoot to the folder that contains all your local web sites (e.g. /users/chris/sites)

5. There should be a PHP configuration file at /etc/php.ini - however this might be missing on a fresh system. If you don't have that file, you make a copy from the default sample in the same directory. The default settings in php.ini should be adequate to run web apps like Drupal or Wordpress. 

6. After you modify that php.ini file, you restart Apache. 

**So we now have a local web server that can serve PHP pages.** 

7. Now we just need to install MySQL. Easiest way is through the package manager command HomeBrew. With HomeBrew, it becomes very easy to install many popular command line programs as well as MySQL. 

So install HomeBrew, and then it's super easy to install mySQL, with one command. Now, as with Apache, you have MSQL installed, and you can start and stop it. MySQL is configured to run without requiring sudo command (which Apache did require)

If you want, you can run Apache and MySQL as services and start as the system boots up - you don't need them to be running all the time though. 

You can create a little script to start and stop Apache and MySQL at the same time, to mimic MAMP's graphical buttons. 




