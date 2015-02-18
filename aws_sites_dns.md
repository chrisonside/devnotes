#AWS Sites DNS

<https://digital-github.bfb1.services.ipcdigital.co.uk/sysadmin/aws-sites-dns>

A project set up by Time Inc Sys Admin to dynamically create sites' internal DNS records in AWS. 

So we use this for setting up internal DNS records for new domains and subdomains. 

Fork and clone the project, and then edit the sites.yml file, to insert your new domain or subdomain. Note that the subdomains we set up (e.g. https://canon.goodtoknow.co.uk) actually point towards our digital DCS-web boxes as opposed to the goodtoknow servers. 

When you pull request that in, as soon as it's merged, a puppet job runs to provision the AWS servers - you can see your internal DNS records (for prod and preprod) having been set up in Jenkins: 
<http://jenkins.services.ipcdigital.co.uk:8080/job/aws-sites-dns/ws/templates/records.html>

You'll need to edit your vhost (in your actual web project) to make it work with the DNS record. When requests hit our web server, the server works out which site and info to call by looking in the etc/apache/vhosts.d folder for the .conf file (config file).

####External DNS

So this is requesting that systems admin set up the external/public DNS and point it to a certain location (e.g. the DCS server stack). 

If a site requires an SSL cert, it will need to be requested from Sysadmin via Trello. These can take time to set up so make sure you give them (as always) plenty of time.

For the external DNS request you need to create a Trello card <https://trello.com/b/lpUuEiJs/sysadmin> 

e.g. 

Hey guys, we have a project for a particular campaign that requires 3 subdomains set up on the DNS please.

They need to point to our AWS (it was DCS right?) boxes on prod, preprod and dev.

The urls are as follows:

http://shoparound.marieclaire.co.uk/
http://shoparound.look.co.uk/
http://shoparound.womanandhome.com/

I have created a pull request for these subdomains on the AWS project:

https://digital-github.bfb1.services.ipcdigital.co.uk/sysadmin/aws-sites-dns/pull/79

Really sorry this is a late one, I was only provided the final URLs today. If you could set these up for me please that would be great.

Thanks

Let me know if you need any more info

John

Craig Dodd
@johnhudson3, do you want me to set up the public DNS to point to the DCS stack now, or do you want to wait until the sites are ready to go live before putting this in?
I see the internal DNS has already been created at http://jenkins.services.ipcdigital.co.uk:8080/job/aws-sites-dns/ws/templates/records.html

John Hudson
@cdodd Please go ahead and point the public DNS to the DCS stack now.

Craig Dodd
These DNS records have now been created.
