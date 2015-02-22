#.htaccess file

<http://www.htmlgoodies.com/beyond/webmaster/article.php/3899416>
Short for HyperText Access file

It's a configuration file used by Apache-based web servers that controls the directory it lives in, as well as the subdirectories underneath that directory

You might encounter this when installing a CMS like wordpress, as whilst you might not have had to edit it, it might have been among the files that you uploaded to your web server. 

Note that some web hosts won't let you edit the .htaccess file. However, where a host won't let you edit it, you can usually create your own .htaccess file and upload it to specific directories, so that it can control those directories and subdirectories below it. 

Features of the .htaccess file include the ability to: 

* password protect folders
* ban users or allow users using IP addresses
* stop directory listings
* redirect users to another page or directory automatically
* create and use custom error pages
* change the way files with certain extensions are utilised
* use a different file as the index file by specifying the file extension or specific file

##Custom error pages for better SEO
Depending on the web server error users encounter, you can use the .htaccess file to redirect users to a custom error page, for example presenting them with a list of your site's top articles, a site map with key links, your site's navigation system, or a FAQ. This will prevent users from giving up and leaving the site. 

First step is to know the proper error code - most common ones are: 

* 400 - Bad request
* 401 - Authorisation required
* 403 - Forbidden
* 404 - File not found
* 500 - Internal server error

So you could create a new htaccess file, with directions like this: 
ErrorDocument 404 /filenotfound.html
ErrorDocument 500 /servererror.html

And then you'd save the htaccess file to your web host's root directory (or whatever directory you want to use it in)

##Using a different file as the Index file - e.g. for a promotion
So when people visited www.yoursite.com, rather than be presented with www.yoursite.com/index.php or www.yoursite.com/index.html, you might want them to visit a special page - you can specify this via a command in the htaccess file. 

	DirectoryIndex index.php3 index.php pictures.p1 index.html default.htm 

So the web server will look for a file called index.php3 first, then if that isn't present, it'll look for index.php first, then if that isn't present, it'll look for pictures.p1 file, and so on. 

##Password protect a directory
So that users will encounter a popup dialog box that requires them to enter a username and password.

If they don't enter a correct password, they get the `Authorization Required` error message (which you can customise too in your htaccess file).

Using htaccess for password protection is not ideal for all situations - you could use it when you were creating a new area on your website and you only wanted certain people to have access. Or you could use it to allow subscribers to your site to enter a password protected area. Or you might wish to password protect an area where your log files are located (or some other administrator specific area).

Read this for more detail on encrypting user passwords and configuring the .htaccess file accordingly <http://www.htmlgoodies.com/beyond/webmaster/article.php/3899661>

  

