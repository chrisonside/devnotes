
#Creating Ads

Clone just the master branch (we don't want to copy every single branch that's been checked in)

Create a branch to work on your ad - ad-brandname-mpu-11/15

If you're working on a new module/updating a module in dev, you'd name your branch differently - e.g. dev-update-transitions

The modules which John has set up can be placed into any of the ad formats (MPU, billboard etc).

####index.html

So you'd paste the html markup for each module required (from the ad read me), into your web/index.html file for this ad.

You'd also call in require.js, jquery etc using script tags. You might also have to add pixel trackers into the index.html file too. 

We have a loading section and a content section (served once the user clicks on the ad to trigger something), both with their own section id's in the mark-up.

The loading content should only be `40kb` (so don't upload a huge image into the loading section).

	<!-- Loading section -->
        <section id="loading-section" class="section loading-section" >
        	// This image should not be larger than 40kb - only load in the rest of the stuff once the user wants to see everything
        	<img src="img/backup.jpg" alt="Want to know what real beauty is?" width="100%">
        </section>

#####Exits
Rather than having anchors in your index.html, you have exits. A DoubleClick exit is a click-through area in an ad. Every rich media creative requires at least one exit. It's best to add exits to the child files only - the parent file is often only seen briefly as the page loads, and we want our exit to be on the page the user interacts with.

The value you insert into the data-exit attribute value (e.g. `data-exit="exit"`) has to be the same name as that given to the enabler exit in the web/js/main.js file:

	var exits = new Exits({
		exit: function(){ Enabler.exit('Exit', ""); }
    });

You style with the exit class, and js-exit is the javascript hook. The data-attribute for an exit can be called whatever you'd like. You might for instance have an exit on a P&G logo, so call it 'exit-pandg'.

####DoubleClick Enabler

We also call the enabler.js in our index.html: 

	<script src="//s0.2mdn.net/ads/studio/Enabler.js"></script>

The DoubleClick Enabler is the core library of DoubleClick studio - the brain of the creative. All Rich Media components and API calls must go though the Enabler. If you didn't have the Enabler, your ad couldn't handle more complex features like video and expand functionality, and it wouldn't have the tracking functionality for metrics like display time, number of impressions, interactive time etc. You include the Enabler script tag in your html head: 
	 
So we now have a singleton object in the global namespace called Enabler, which we can call methods on - e.g. as above, `Enabler.exit()` or `Enabler.isInitialised()`

Nothing in your ad should auto-execute until the Enabler has initialised - this ensures everything is properly loaded and Enabler methods can be accessed - you don't want the user interacting with your ad before this happens. So in our javascript, we use the Enabler.isInitialised() method which returns true or false - if true, make the call to start your function (e.g. start loading in your image assets, call tracking methods or other modules in, and/or start the animation - however you want your ad to work). If false (i.e. Enabler isn't initialised yet), you make a fallback call that listens for the Enabler's INIT event). 

	// If true, start function. If false, listen for INIT.
	window.onload = function() {
		if (Enabler.isInitialized()) {
      		enablerInitHandler();
      	} else {
      		Enabler.addEventListener(studio.events.StudioEvent;INIT, enablerInitHandler);
      	}
    }

#####Polite Loading 
The Polite Load module only loads in images when they are needed. You will have uploaded all the images you require into the web/img file. If you give the images (in your markup) a class of js-polite, then if they are children of the currently loading section, the polite loading module takes the data-polite data attribute of the images and inserts that into the previously empty src="". It ensures that the user only downloads images they want to see. 

All images in our ads are polite loading on the whole. 

So DoubleClick checks that tracking is ready, that the page is ready for the advert, and then loads in the content.
  

####Main.js (used to be known as app.js)
This is where you say which modules should be called by require.js - so you'd grab the initialisation code for the module you want to use, and insert and edit that in the main.js file.

So you might call the doubleclick module (that waits for the enabler to initialise, the parent page to load, and sets up the tracking). And then call the switcher module in for switching between the loading and content sections.

Also within the main.js file, we call the custom function (which we fill out in our custom.js file).

The code we write in main.js says which modules we need. Then require.js fetches all of those javaScript modules (it doesn't need Grunt yet to do this). Grunt.js only gets involved when you're ready to publish your code and so you want to concatenate everything into one file. DoubleClick likes to have one flattened file, and Grunt automates this. 

When it comes to Grunt, you can have this running all the time (as per SASS), or you can run it once at the end when ready to publish. 

#####require.js
Require.js uses the AMD (Asynchronous Module Definition) API for JavaScript modules. It allows us to just load the js modules that are required, rather than inefficiently calling 15 script tags for javascript modules that might not even be required. 

As per John's notes in <https://digital-github.bfb1.services.ipcdigital.co.uk/creative-media-digital/ad>, some of these javascript modules have dependencies (other modules that also need to be loaded) - require.js is clever enough to go and fetch these. 

So in the amplify module code for instance, you'd start off by declaring the dependencies (other js modules which amplify relies on): 
	
	define(['autorunner', 'helpers', 'switcher'])…
 
Likewise the switcher module depends on the transitions module, and so on. 


####custom.js file
The custom.js file starts out empty - this is where you add the custom javascript for your ad.

So define which modules you'll need:
	
	define(['switcher', 'autorunner'], function (Switcher, Autorunner) {

Then in the function Custom() you define your global variables (e.g. this.articleSwitcher =… rather than var articleSwitcher =…)

After defining your global variables, you then declare your prototypes. E.g. 
	
	Custom.prototype.rotateArticle = function () {
		this.articleSwitcher.sections.next.show();
	};


#####Helpers
Anything that helps out but doesn't need it's own module.  

#####Pictela
There is a module containing all of the Pictela initialisations and listeners. You'd need to call in the Pictela js library in order to track in Pictela. Have a look at a Pictela project as you'd have to replace doubleclick mentions with Pictela in several places. 


#####Videos
We need to upload MP4 and WebM types of video. 
30 seconds ideally - no longer than a minute. 10 Meg is the max. 
We have a poster that disappears when the video is loaded. 

#####SASS/CSS
The CSS is largely already set up. The only CSS we change per campaign is the content-section.css and the loading-section.css. 

In the content-section.scss we always set a generic background colour.

There is a transition mixin is set up in _helpers.scss

#####Switcher
This uses IDs to switch between several pieces of content (sections). The first section is shown on load and the rest are hidden.  

When we paste the switcher code from the ad read.me into our custom.js, we declare it as this.articleSwitcher rather than var articleSwitcher = …

#####Panels
In index.html, we set a class of section-hidden on panels until we want them to show up. It's best to position the panels absolutely over each other and then show them when needed. 

In the example John showed me, he made all the images transparent pngs and all the images were the same size (which was the size of the ad) - then as different elements appeared in the ad, it was just a case of displaying that png. 

#####Autorunner
In the example above, the time between panels switching over was determined using the Autorunner module (whereby you create a simple JS interval and run a callback function).

Note - if you're just doing things once (e.g. one switch), it's fine to use a setTimeOut rather than pulling in a whole Autorunner module. This will be more efficient, code and kb wise. 

####z-index
Unelss you specify z-index, the order images appear in your mark-up determines what goes on top of each other.

####Tiny png
Use this to crush your png images before including them in the project

####Uploading to DFP/Pictela
Get advertiser name for DFP off Ad Ops - we pair this with our DoubleClick tag. 

####Checking it in
git push origin ad-brandname-adtype-0915
Note - if you're doing a campaign that has two types of ad (e.g. MPU and billboard), and where you might be using the some of the same assets, you can then just check out this branch again, and make edits for the next ad type - then check it in - ad-brandname-newadtype-0915

####Retina images
We'll sometimes use these if the ad is getting served onto tablets.

#Position everything absolutely on the ads - it's way easier


##The actual work flow for updating my first ad and uploading to DoubleClick

So first of all I cloned the project. We were able to just clone master, but then we couldn't get access to the existing dove branch which we wanted to copy and edit (to speed our work up).

So after cloning the project: 
* git checkout ad-dove-mpu-0315
* then from within that branch: git checkout -b ad-dove-mpu-p2-0315
* sass --watch sass/main.scss:web/css/main.css --style compressed

After making the required updates, the git status showed that git had two new untracked files of node_modules/ and web/dist/. We don't ever want to check those files into git, so we edited my global git ignore file:

	creidy@dcs-dev-web-02:/sites/personaldev/creidy/ad  (ad-dove-mpu-p2-0315)$ cd
	// To get me back to the root file
	creidy@dcs-dev-web-02:~ $ ls -la
	// To list everything, including the  hidden files
	
I then vi into `.gitignore_global` and added node_modules/ and web/dist to the list, as well as .* - to ignore all the local . files that I would never want to commit to git.

So after pushing my updated files to github, I then wanted to upload my work to DoubleClick. 

First step is to put all my files into the distribution file - DC requires that all our files are in one folder. 

To do this, I'll need to run the grunt command…

#####Grunt
So this involves keeping my dcs-dev tunnel open, but then also opening a new terminal and ssh-ing into buildslave box - the buildslave box has node.js installed on it, and node.js is used by grunt. 

That's the box, but we also need grunt in our project. So we have a grunt.js file in the ad repo for that, as well as a package.json file. The package.json tells npm which dependencies the project has (i.e. which packages it needs) and then the grunt.js file allows us to configure the tasks run by grunt that are possible once we have the necessary packages. 

In the ad project, we already had a grunt.js and package.json file, and so all we needed to do was tell my project that I wanted to use grunt. I did this by running the command `npm install` - if I was setting up a brand new project altogether, it would have been `npm init`, which would have taken me through the steps to create a package.json file and so on. 

Think of npm a bit like the royal mail. If a dev wanted to build a package that he wanted distributed to others, he would make that package available on npm (a free open source service). Other devs  with npm running at their end can then access those packages. 

When we run npm install, npm will then look through our project for the package.json file, see the npm mentions (i.e. the dependencies required) and go and fetch them.  

Now I can run the grunt command and it will work, as I have all the necessary packages running in my project. 


Within DoubleClick studio

* Use the TimeInc UK account
* We are fine to create a new advertiser in the list
* Then there are campaigns and adverts within
* The ads have a specific naming convention - e.g. p1v1.0 - phase = if it's the next phase of content updates. v = client updates (e.g. v2, after the client requested an amend). 1 = our team's updates, for if we spot something and make our own tweak, independent of the client asking. 

Whilst we normally would create a new ad, in this case we pressed copy on a similar advert. We then just dragged in our new images (from the dist folder) and clicked yes to overwrite the old images. We also had to select which image to use a backup image - it didn't automatically pick our backup jpg as it was 2 pixels less wide than the ad, but this was done by us on purpose as there was a 1px border. 

Also check the exits tab - this should say there is an exit, but traffic actually fill in the exit URL. 

You can also check the preview. Send the preview link to the PM. And also the 'show details' tab is cool as you can check tracking and that buttons work. 

We then publish from our end - I can't personally publish until I've passed the exam. We then let Emma in traffic know it's published at our end, as she needs to set it up and publish from her end too. 

####More detailed DoubleClick instructions

* I copied the name of the other Sensodyne ad (for speed). 
* Then hit 'New creative' (from files)
* Make sure advertiser and campaign name are correct, then fill in your creative name
* Format is usually either In-page or Expanding (for when you hover on an ad and it expands)
* Enter the ad size - fine to create a new size if it isn't listed
* My dist file will be ready to upload by then (make sure you empty the previous project before running grunt on buildslave to generate the new dist files)
* index.html will be selected as the primary file, but you'll need to select backup.jpg as the backup
* Also in your index file you'll need to make sure that all paths (to click trackers, or fonts) start with // rather than http - else you'll get warnings from doubleclick. If you do get warnings, make the amend, then rerun your grunt command and redrag the updated file into doubleclick. 
* For now, we also needed to take out non-required stuff in our doubleclick.js file (e.g. related to expanding functionality), as this was throwing up errors otherwise, as DC was then looking for expanding functionality elsewhere in our project, but wasn't finding any. 
* In the preview, if you hit show details, you can see the exits and other details on your ad. You can test the exit works by clicking your exit on the preview ad. You can click to expand the preview viewing pane too. 
* Before publishing, you want to send a preview link to the client. At the top of the page, click on the advertiser name, then the campaign preview link. 
Then select the ad that you want from the drop-down, and it will update the URL (after iA) with that particular ad. Then send this link to the client.  

* When I check my branch into our github repo, I should check in everything except the dist folder - I've added dist into my global git ignore file, so this shouldn't be an issue.  

* Once the client has approved the ads, select them in DoubleClick, and click on  Approve and Submit in the QA options. Their status will change to trafficked, and the ads will show up in Emma's corresponding advertiser entry in their DoubleClick. I then send a message on Basecamp to traffic saying that the ads have been pushed to traffic and paste the names of the creatives into the message too. 


##Making changes to ads
If you're making big changes to an ad, duplicate the whole ad (so that you've got a fresh ad to work on in DoubleClick).

If you're making small changes to an ad, it's fine to click into the ad, overwrite a file, and then update the ad name within that ad preview pane. So this wouldn't create a new ad in your list of ads, rather just update the existing one. Note that this ad's status would then go from 'trafficked' to 'in development' - don't worry about affecting the live adverts, they won't be affected just yet. You'd then need to click to approve and submit again. 

Each time we click on ads to submit and approve them, the ads we've clicked on are packaged up in a little ball and sent over to traffic. Traffic can then pick ads out of that ball and update their systems. But as we are sending a fresh ball over each time, we don't need to worry about our making changes at our end affecting the ads on the live site (until we've pushed them to Emma so that she can get them live).

