#DNS

***DNS'*** job is to ***turn a user-friendly domain name into an Internet Protocol Address (IP Address)*** that computers use to identify each other on the network.

So the ***DNS Server manages a database that maps domain names to IP addresses***. 

* When a request comes in (e.g. user types in www.wearityourway.look.co.uk), the Domain Name Server looks for the name in its database and returns an IP adddress which the client can then make a request to.  

* To see an example of what happens when a DNS client queries a DNS server to resolve the name, use the dig command in the command line. E.g. 
`creidy@dcs-dev-web-02:~ $ dig http://www.google.com`
Looking at the result - ns1.google.com. dns-admin.google.com. 1550731 7200 1800 1209600 300 - you see an IP address. 

* So in this case I've asked Systems Admin to set up three URLs on a DNS Server (not necessarily an IPC specific DNS Server) which will point to our (commercial solutions' DCS) web server's IP address. Depending on the configuration, the IP address might actually be the load balancer for our box (which decides which of the DCS live boxes to point to (1,2 or 3). Or it could be pointing to Akami or ZTM. But the request will eventually make it through to our DCS boxes. 

* When the request hits our box/web server, it says that someone has requested a page, and tells the box various details, such as 'this is the host header, and this is the info they want'. First the ***web server needs to work out which site and info to call, and to do this it looks in the etc/apache/vhosts.d folder for the .conf file (config file)***. 

* For ***each site deployed, there is a config file on the web server***. Every time you add a new config file, you restart the Apache Web Server (you might notice the restart being mentioned when you deploy a site in PRM).

So the ***config file*** is all about setting stuff up on the web server. Looking in the config file: 

###VirtualHost *:80
Most things on the web are done through ***port 80*** - unless it's a ***secure SSL site, then it's port 443***. When we say we're setting up a virtual host, this is because rather than each site having it's own web server, multiple sites are hosted on one web server. 

If it's a secure site (so on port 443), you will have another `<VirtualHost>` listing with the server alias and document root for the secure site.

###ServerName & ServerAlias: 
The server alias means you can add in internal DNS parameters - so for example: 
*.tu-wearityourway.co.uk.*.ipcdigital.co.uk

###DocumentRoot
The DocumentRoot gets installed onto the web server when the site is deployed. So if you go into var/www/tu-wearityourway.co.uk/web on creidy@dcs-dev-web-02: you'll see the root of that site. 

###Logging
The logs tell you where the access logs are to be found. We log every request made to a server in these logs - if there's a problem on the site, you might well check out these logs whilst troubleshooting. 


#####So I need to request that Systems Admin: 
* Set up these three URLs to point to our DCS boxes from the DNS Server
* Set up SSL certificates for each one
* I add that request to systems admin through Trello
* I might be able to do some of the work by adding a pull request with the relevant file changed (Matt's done this previously)
* n.b. I might only need the live URLs set up on the DNS Server, as we now use the .node qa url. I need to deploy my work to QA and then see if I can get it working using the node QA URL. If so, I just need to request sys admins' help with the 3 x live URLs