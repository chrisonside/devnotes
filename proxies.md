#Proxies

<http://www.howtogeek.com/178481/what-are-the-benefits-of-using-a-proxy/>

A basic advantage of using proxies is that they make you more anonymous. 

If you don't use a proxy when you connect directly to a web server (albeit via ISPs, DNS and so on): 

* The server will know your external IP (so can identify your geographical location)
* The server knows the cookies you have on your computer
* The server knows which browser you're using and what plugins you have installed. The server knows this because your browser sends the `User Agent string` which can be used to identify a browser (and which version), OS version, and sometimes installed browser extensions
* The server will know which page you were on before clicking to their site - because an HTTP referrer is sent each time you click a link. 

N.b. a HTTP referrer is an HTTP header field that identifies the URL of the webpage that linked to the resource being requested. 

Whilst you can try to block cookies, UAs and referers in your browser, there are more programs that use HTTP, most of which won't let you tamper with settings. So it's best to use a proxy: 

	Client <-> Proxy <-> Server

Now if all your network traffic is passing through the proxy, it can alter it: 

* It can replace the User Agent string with some meaningless string, or strip out the referrers. 
* It can either block all cookies, or maybe accept them all but not pass them to you
* It's the proxy that's connecting to the server, not you, so your IP isn't disclosed. 
* A proxy can be set up to work system-wide, so programs won't be able to bypass it. 

Additional features of proxies include: 

* It can compress your traffic to save bandwidth
* The proxy can cache files to boost page load times
* It can strip ads from websites before they reach your computer
* It can block dodgy websites 

So a proxy can be used as a filter as well as against filters.  

##Reverse Proxy Server

<http://en.wikipedia.org/wiki/Reverse_proxy>

So a proxy server acts as an intermediary for requests for clients seeking resources from a server. 

A proxy server may reside on the user's local computer, or at various points between the user's computer and the destination servers on the Internet. 

A `reverse proxy server` retrieves resources on behalf of a client from one or more servers. These resources are then returned to the client as though they originated from the proxy server itself. 

Reverse proxy capabilities include: 

* Revere proxies can hide the existence and characteristics of an origin server or servers. 
* Application firewall features can protect against common web-based attacks. 
* In the case of secure websites, a Web server may leave SSL encryption to a reverse proxy that is equipped with SSL acceleration hardware. 
* A reverse proxy can reduce load on its origin servers by caching static content as well as some dynamic content - knows as web acceleration. 
* Requests that do need to go through to the servers can be distributed by the proxy server efficiently. 
* The reverse proxy can optimise content by compressing it to speed up load times
* Spoon-feed technique - a dynamically generated page can be produced all at once and served to the reverse proxy. The reverse proxy then returns it to the client a little bit at a time. This means the origin server can disconnect and get on with other things. 
