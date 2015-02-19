#Internet Data movement

Internet Data moves via packet switching. This is different to circuit switching - like when you telephone a friend, where the circuit stays permanently open between your two phones until someone hangs up. This is an inefficient way to use a network. 

Circuit switching only works on the Internet if you have a traditional dialup connection (where you computer dials a telephone number to reach your ISP). 

The Internet largely works via `packet switching`. 

##Packet switching: 

* Doesn't have to have a permanent connection between the two places
* As you're not blocking an entire chunk of the network each time, many people can use the network at the same time
* The data is broken up into tiny packets and can flow by many different routes, depending on which are quietest or busiest (e.g. if you send an email to someone in China, the email is broken up into tiny packets, each tagged with its ultimate destination and allowed to travel separately, reassembling when they reach their ultimate destination). 
* This leads to quicker and more efficient communication all round. 

##Servers

Machines that provide services, or machines that are like electronic filing cabinets that simply store information and pass it on when requested.

* File servers - machines that hold ordinary documents
* Mail servers - machines that hold people's mail
* Web servers - machines that hold Web pages

##Clients

A computer that gets information from a server. E.g. when you Mac connects to a mail server at your ISP so you can read your messages, your Mac is the client. 

##Routers

The Internet is also made up of intermediate computers called Routers, whose job is just to make connections between different systems. The router is like the mailbox at the end of your driveway - it's your single point of entry to the worldwide network. 

As well as making connections, routers determine if traffic is internal to your LAN (the computers in your home/work) or external. Routers then route the traffic appropriately (internally or externally).

Finally, routers act as a firewall to protect your LAN, blocking unwanted traffic in or out. 

##MAC Address

Every piece of hardware has a unique address burned into it - a MAC address. E.g. there is a MAC address in your laptop's network card, in every server, every iPhone, every router etc. Like a serial number burned into the chip. If you are browsing on someone else's wifi, they can see your MAC address and tie any browsing to you. You can spoof your MAC address though. 

##How the Net really works - TCP/IP & DNS

Protocols are sets of rules or processes for activities on the Internet.  There are lots of different protocols, e.g. 

* SMTP - Simple Mail Transfer Protocol (to handle your mail)
* HTTP - Hyper Text Transfer Protocol (to serve up web pages)
* TCP/IP - Transmission Control Protocol/Internet Protocol (to control the packets of data)

**TCP/IP is the Internet's fundamental control system - and it is effectively 2 systems in one.** 

##TCP

TCP sorts out how packets of data move back and forth between one computer (one IP address) and another (IP address). 

So TCP works out how to get the data from the source to the destination, arranging it to be broken up into packets, transmitted, resent if they get lost and reassembled into the correct order at the other end. 

##IP

Internet Protocol is the Internet's addressing system. Every machine and server has an IP address. 

##DNS
Domain Name System - like a phone book system. You know someone's name (www.domainname.com) - now you need the number (IP address) to connect with them.

##Packets
Every piece of data you send is broken down into packets. 

When you load a web page, your computer sends TCP packets to the web server’s address, asking it to send the web page to you. The web server responds by sending a stream of TCP packets, which your web browser stitches together to form the web page and display it to you.

So imagine mailing your friend a book, page by page. Each packet (page in this case) would have to carry the: 

* My (the source) IP address
* Intended IP address
* The page number to let your friend know what order it goes in (i.e. where this particular packet fits back into the data sent, when its reassembled)
* The total length (so your friend knows how many packets to expect)
* There are lots more items in the `packet header`, but these are the most important

Each packet might be sent down a different set of wires to the destination. A router sends the packet to the nearest available router that is closer to the destination and hopefully isn't too congested - it figures out which router to send it to based on the numbers in the IP address. The first three numbers identify a large area, and the rest make it more specific. Like a post code. This is know as 'best-effort delivery'. 

So packets will take different times to arrive. However, `TCP is all about reliability`: 

* packets sent with TCP are tracked so no data is lost or corrupted in transit. 
* If senders don't get a correct response, they resend the packets to ensure they are received. 
* Packets are also checked for errors.
* And TCP guarantees the recipient will receive the packets in order by numbering them. 

So TCP isn’t just one way communication — the remote system sends packets back to acknowledge it’s received your packets. 

And when packets do arrive, the server or computer receiving it compiles it into something cohesive (using TCP). And the receiving computer then sends a message back to the originating computer to say thanks and goodbye. 

If the recipient is completely offline, your computer will give up and and you'll get an error message saying it can't communicate with the remote host. 

##Basic Internet Topology

In a basic internet topology, there are 5 clouds. 

* Your LAN (green zone)
* Your ISP
* The Internet
* The Webpage's ISP
* The LAN of the Web Server

The modem (at home for instance) is really part of your ISP's network. It's the gateway that your Home Router connects to so you can talk to your ISP. 

One important thing to note is how many servers and companies are involved in handling your data. 

Note that you don't connect to the Internet directly - you connect to your ISP. Think of your ISP like a mail truck that picks up your mail and delivers it to the local postal facility. Your ISP will have it's own DNS servers. 

####Routers
Routers are used at every level of the topology above, to route traffic along. Your router at home or work has a rule that 192.168 IP addresses are reserved for LANs (e.g. a print request)

####Firewalls

The firewall is an important function of your home or work router. A firewall is perimeter security, keeping out intruders and keeping programs inside your LAN from communicating out (like a trojan trying to call back out, or someone trying to reach a restricted website).

 
##UDP - User Datagram Protocol

<http://www.howtogeek.com/190014/htg-explains-what-is-the-difference-between-tcp-and-udp/>

Whilst TCP is the most commonly used protocol on the Internet, UDP is used when speed is desirable and error correction isn't necessary. 

N.b. A datagram is the same thing as a packet of information. 

UDP works similarly to TCP, but it throws out all of the error-checking stuff, thus speeding up the connection and reducing latency. 

With TCP, all the back and forth communication and deliverability guarantees slow things down. 

But with UDP, packets are just sent to the recipient. The sender won't wait to make sure they received the packet, it will just continue sending the next packets. 

If you are the UDP recipient and you miss some UDP packets, told bad, you can't ask for them again. So there's no guarantee you are getting all the packets - however losing all those guarantees means the computers can communicate more quickly. 

So UDP is used when speed is paramount and error correction isn't necessary. E.g. for live broadcasts or online games. Live streams like footie games are often broadcast using UDP instead of TCP. The server sends a constant stream of UDP packets to computers watching. If you lose your connection for a second, the video freezes for a moment and then jumps to the current bit of the broadcast. If you only experience minor packet loss, the video might continue to play but be a bit distorted. 

Whether an application uses TCP or UDP is up to its developer. Most applications want the error-correction and robustness of TCP, but some applications need the speed and reduced overhead of UDP. 





