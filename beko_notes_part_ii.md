#Beko notes part II

#Caching, Akamai, & cachebusters 
In your symfony project, you can set a root and max time, and Akamai will cache content for as long as you put in there. We don't do much of this, but we should really - for instance, if the content on your homepage isn't going to change, you could by all means set a cache on that homepage, to speed up load times as everything would be served quicker. Also, the AWS bill will be higher if there is never any caching applied to Time Inc sites! 

You can cache anything! So Tony for instance added a 86400 milliseconds cache for the Brightcove videos, as they were very unlikely to change, and it avoided us hitting Brightcove every time. 

We never want to cache competition pages - otherwise you'd see stuff entered by the first entree! 

In order to cache bust my CSS in my symfony project (thus negating the need to clear the Akamai cached CSS - on Campaign, the CSS and javascript are cached for 24 hours unless you clear it, or unless you release a cachebusting CSS in the project), I just added ?v=2 to the CSS file call in the view.yml. 

In order to get an Akamai account, speak to Lee, or ask in the Ops room. You can be honest in there and just say I want to set up an Akamai account, how can I get one set up? 

It's better to cache bust your CSS though, rather than constantly clear the Akamai cache, as each time you clear the akamai cache it create a new file in Akamai - not the end of the world but unnecessary.

If you are going to clear the cache in Akamia, you need to select exactly the page that you want to clear - don't just clear the cache for the whole site!  

One thing to note, is that if it's an SSL page, it's really expensive to cache at the Akamai level (though we might use Cloudfront in the future). So for the time being, if it's an SSL site, the only cache in play is at the Symfony level. 

You can see what's cached (and how long for) at the Symfony level, using the Symfony task bar - there is a red box around cached things, and it tells you the cache time. 

When it comes to getting a site onto Akamai, you can either do it all via Akamai (but it's really time-consuming). Or Alan Lapthorn set things up so that we can just put in cache headers that Akamai reads (e.g. "cache me for 15 minutes").


##It's vital to get proper content onto preprod
Don't just release straight to live, make sure it all works on preprod - it's a vital part of the release process

##Creating video players in Brightcove
There are lots of notes on the Brightcove API. But Rich's vague explanation was that you can set up a playlist of videos in BC, this playlist has an RSS feed. You then curl that RSS feed from your code. Then you just whip the ID's into a player. And the BC API does the show and hide work. There is also a js wrapper that Rich wrote, which goes around the BC API. 

I think (might be wrong) that Rich said that an advantage of building the player in BC, and then setting a cache on your code in Symfony too, is that rather than there being an IDA call to the database, which looks for categories, then video IDs within those categories, this would all be cached at the Akamai level (effectively turning this all into a 'flat file' (need to read up on this) - and speeding the load up).

Main thing is to read the BC API notes

##Re: sites not looking great on mobiles
I can mention this in early meetings, though sales should know whether a site would carry well onto mobile. But not every site has to look great on mobile - particulary sites that are being iframed into non-responsive sites such as House to Home. 

In the future though, we might be building subdomained sites, with our own lookalike (but responsive) headers and footers which look just like the brand in question - this would allow us to build our site responsively though. John is looking at continuing Rich's build currently. 

##Getting things looking ok in ie8. 
Don't ever build especially for ie8. 

However, each day when building, give it a quick check at the end of the day on ie8 in preprod (rather than one big test at the end of the project). This will make it much easier to fix ie8 issues as you go along, and will make it much less daunting. It doesn't need to look awesome in IE8, but it can't look broken. 

Make a list of things that don't work in IE8 (as you encounter them) - so that you get used to setting fallbacks as and when required. e.g. you know that REMs are never supported, so set a default font-size. Likewise you know that opacity is never supported, and you know that media queries won't be supported! But if you drop in respond.js, this is your work around to media queries not working in ie8! 

##Getting up to date browsers

Just use my admin account, and install new firefox for example. I can even install new Firefox and share it with creidy user. 

##Setting explicit heights & THE BOX MODEL
The main thing is to understand the BOX MODEL - absolute key part of CSS theory that I need to learn. If you can understand HOW THINGS FLOW with CSS, and understand the box model completely, everything becomes easy. 

You should practice in jsfiddle with everything the box model has to say - after that, controlling things becomes way easier. 

When it comes to seting heights - it's fine to set heights in pixels if need be. The main thing is to get something working, and if that is an elegant enough solution for that piece of content, that is fine! Pick the best solution given your current skills (look online for advice too!). Don't agonise over it - get things done!!! No-one writes perfect code. 

Another approach Rich mentioned was (I think) to use overflow hidden (rather than a set height), and content is as high as the biggest piece of content. 

##Layout.php
Title and metas get set in the view.yml
Only async JS in the head! (like Typekit)
jquery and link to custom javascripts (like application.js) - go in the foot of the page. 

You only need to set the meta data in the actions.class (as Rich did with Superdrug), if it needs to change dynamically - e.g. if you wanted to change it depending on which page was being called. 

##Competitions
The comp classes create a link between the CMS2 comps and the IPC databases. We then set up a form which ties in with this comp class. 

Lee set up a lot of the competition classes, so he's a good person to ask about them if in doubt. But try and follow the code - key part of a dev's job is to look up commits and understand old code. 

##Should I focus on javascript or jquery? 
Rich says learn javascript basics, then focus on nailing jquery, then learn about the hardcore javascript afterwards. 

##Setting up URLs
Read the guidebook for setting up URLs internally, before asking Sys Admin to set up external URLs.

##When building Clinique site…
Don't just follow the PSD design - there are loads of changes at the build stage that we need to bear in mind! 

##Re the preprod images issue
Tell Lee,and put in a Trello card - this should have been fixed. 