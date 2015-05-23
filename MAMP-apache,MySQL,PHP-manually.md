##Setting up a (semi-native) local web development environment manually

OS X already has two components of LAMP stack pre-installed - PHP and Apache. 

So whilst you can use free Apache distribution programmes like XAMPP (which contains MySQL, PHP & Perl) to get your web environment up and running, what's the point if you then have redundant programs on the system. 

The below details setting up a MAMP environment manually...

####Configuring Apache & PHP

So Apache server is pre-stalled in Mac OS X, therefore there's no need to install it. 

You do need to start the Apache server though: 

	sudo apachectl start
	
You can also run commands like: 

	sudo apachectl stop
	and 
	sudo apachectl restart
	
Note that each time you make an edit to an Apache file, you'll need to restart Apache for it to take effect. 

###N.b. General folder structure on my Mac

This stuff is useful, even if it doesn't relate specifically to the Apache stuff (it came up when I was chatting to Eduardo).
 
* pcp142353pcs:Sites chris$ - the pcp bit is my computer name, Sites is the folder which I'm in, and chris is the username I'm logged in as (in this case, my admin account)
* Every Mac O/S has a / folder, which is the root of everything on that Mac O/S.  
* Then there will be a /users folder where different people using this Mac can store their stuff. So when logged in to my admin account, I can see users called 'chris', 'creidy1016' and 'shared'. However, if I try and create an index.html file using touch in creidy1016 (i.e. another user's home folder), it will deny me, as I'm logged in as chris. 
* When you do cd ~ this is shorthand for cd /users/chris (or whatever you are logged in as - e.g. it would take me to /users/creidy1016 if I was logged in on my normal account)
* pwd tells you which folder you are in

##DocumentRoot
Back to Apache stuff, and DocumentRoot is the directory out of which I will serve my documents - i.e. when you load http://localserver/ this is the directory the local Apache web server will look in, to find your web files. 

By default, Apache serves files that are in the folder location /Library/WebServer/Documents - the system level web root.  

However, you can choose instead to set what your documentRoot is (a user level web root). For instance, I wanted to create a user level web root for my projects (so that the url would be http://localserver/~username/), and so I changed my documentRoot manually (as detailed below - Configuring Sites Folder section). 

Note that to see what your documentRoot is currently set as, you do the following: 

	pcp142353pcs:/ chris$ grep --color DocumentRoot /etc/apache2/httpd.conf
	# DocumentRoot: The directory out of which you will serve your
	DocumentRoot "/users/chris/Sites"
	# This should be changed to whatever you set DocumentRoot to.
    # access content that does not live under the DocumentRoot.
    
So in this example I'd already set the DocumentRoot to be /users/chris/Sites


####Configuring Sites folder

As noted above, on a mulitple users system, e.g. on my Mac O/S, where I had two users, 'creidy1016' and 'chris'(my admin account), you can set up your local Apache web server to serve files for different users using the url 
	
	http://localhost/~username

To do this, we need to create a new user config for Apache:

	pcp142353pcs:Sites chris   $ sudo nano /etc/apache2/users/chris.conf
	
	(chris.conf in this example, as i'm logged in as chris).
	   
	We edit the new user conf file to look like:  
	 
	<Directory "/Users/chris/Sites/">
    	Options Indexes MultiViews
    	AllowOverride None
    	Order allow,deny
    	Allow from all
	</Directory>

And then you need to edit your local Apache web server config file, to enable using our (new) own user directory to serve files - this involves editing httpd.conf. (Apache HTTP Server is configured by placing directives in plain text configuration files, the main one of which is usually called httpd.conf). 

<http://httpd.apache.org/docs/2.4/configuring.html>

To edit the main Apache config file, it's: 

	pcp142353pcs:Sites chris	$ sudo nano /etc/apache2/httpd.conf

These are helpful blogs telling you how to configure the Apache config file accordingly: 

<http://ole.michelsen.dk/blog/setup-local-web-server-apache-php-osx-yosemite.html>

<http://httpd.apache.org/docs/trunk/howto/public_html.html>

<http://www.maketecheasier.com/setup-web-server-in-mountain-lion/>

<http://stackoverflow.com/questions/24583859/apache-localhost-username-not-working>

<https://www.urbaninsight.com/2014/09/22/semi-native-lamp-stack-os-x>

This is an example of how an Apache config file looks: 
<https://collab.itc.virginia.edu/wiki/toolbox/example%20httpd.conf%20file.html>

Don't worry too much about breaking Apache - it's only my local version which I'm using for my local web environment, so I can always fix it. It's not like I'm going to bring any live sites down. 

Once I've got my configured Apache, to set my DocumentRoot as my user level web root, I can then check that this is working. If I create a simple index.html/php file in chris/Sites/ and then go to `http://localhost/~chris/`, it will display that file. 

##PHP

I had to uncomment the PHP line in the Apache file: 

	LoadModule php5_module libexec/apache2/libphp5.so
	
Then to check PHP was up and running, I created a php test file in my chris/Sites folder (i.e. my new user level web root): 

	nano /Users/chris/Sites/phpinfo.php 
	
	then paste in
	
	<?php phpinfo(); ?>

Then restarted the Apache Server. 

Now when I go to http://localhost/~chris/phpinfo.php, I see the php info page. 

##MySQL

Whilst Apache and PHP are already installed on a Mac (Mountain Lion), MySQL has to be downloaded and installed manually. 

As per these instructions <https://www.urbaninsight.com/2014/09/22/semi-native-lamp-stack-os-x>, I did this via installing first HomeBrew, and then MySQL. 

After MySQL is installed, you can then start and stop mySQL easily: 

	mysql.server start
	mysql.server stop
	
Note that MySQL is configured to run without requiring sudo command. 

Finally, if you want to, you can build a little script to start/stop Apache and MySQL at the same time, to mimic MAMP's graphical buttons. 


