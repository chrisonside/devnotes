#Brightcove

So the key components of BC are players and videos. 


####Players
* We use the same BC player in various hubs. 
* You can create new players if you want a custom one. Read the documentation on that, but it's pretty straight forward. You might for instance create a custom player if you wanted a geo location filter on there for instance (some of the brands might do this if they only want videos viewable in the UK), or if you wanted a custom look to the video player.
* So unless you're creating a brand new BC player, you can likely borrow code from other projects we've done, to grab the BC code. 


####The code
The key things in the code are the object id="myExperience<videonumber>" (this is a reference to the video id) then the playerID and playerKey, as well as the @videoPlayer (also the value of the video). In our projects, we usually pass in the video id from CMS2, so that our BC code is dynamic. So:
	
	<object id="myExperience<?php echo $video; ?>" 


#####Smart player
If you were to just grab code from the 'quick video publish' tab in Brightcove, it would just spit out the basic parameters for having a BC video on a web page. However, on our sites, we want to include the parameters (and accompanying functions) that make ours a smart player. 

So the key parameters are: 

	 <param name="includeAPI" value="true" />
				<param name="templateLoadHandler" value="feature.playerLoaded" />
				<param name="templateReadyHandler" value="feature.playerReady" />
				
This calls the `playerLoaded and playerReady functions` (we manually include these functions in our website's js). Our dev team tends to use these functions wherever we want a smart player, as it allows us to call BC functions like .play(). And within these functions we can also do things like hide the cover image for the video, prevent the click through default etc. 

We are able to call on BC functions in our JS, as there is also a script tag included in our page, which links to the Brightcove JS file. e.g. 

	<script type="text/javascript" src="http://admin.brightcove.com/js/BrightcoveExperiences.js"></script>
	
You also need the following line (I've included BC comments for this documentation, but the comments are not required in our actual website code): 

	<!-- 
	This script tag will cause the Brightcove Players defined above it to be created as soon as the line is read by the browser. If you wish to have the player instantiated only after the rest of the HTML is processed and the page load is complete, remove the line.
	-->
	<script type="text/javascript">brightcove.createExperiences();</script>

The script tags might be in the view.yml file in our project, or on the page itself. 


####Video cover images
When it comes to the cover image for a video, we do this in our code, rather than using the settings in BC (where in the settings for each video you can choose a cover image). This is because we want our video image covers to have a play button on them. However, if you add an image with a play button via the BC settings, you end up with a double play button in Firefox, which likes to add its own play button on top of videos. However, if we control the cover image (with play button included in image) via our own code, then using CSS we can position the cover image so that it always sits on top of everything, and so the double play button in Firefox is not an issue. 

We can also make these video cover images dynamic, pulling in a CMS pic for each video:

	<div class="coverFeature"><img class="posterFeature" src="/images/clinique/poster.jpg" width="100%" /></div>

##Gotchas

* BC looks to use Flash first to play videos in browsers. If Flash isn't supported, it falls back to HTML5 video. 

* There can be issues when testing Brightcove videos in Browserstack. 

* IE won't play your video if the player has `visibility: hidden` or `display: none`. This is because IE will look through the code, not find the BC object, and thus not call the video (even if you use javascript to subsequently change the values mentioned). `Opacity: 0;` is fine though, or we used `z-index` in the Clinique project. Main thing to ensure is that the BC div is visible to the browser - once it's said 'I'm here', it can call functions (which we can write or configure) using it's smart parameters and you go from there. 

* Make sure you're passing through a video ID! Sometimes Matt has found he's just passing through object id="myExperience"  but without a video ID. 

* Always have a div (e.g. video-container) around the video object. As IE injects a span tag around the BC object, it's best to have a div around the whole thing - that way you have a handle (the div) which you can control things with, rather than trying to combat things by trying to style the injected span. So in our clinique project, we had a .video-container around our video object. 

* `wmode value="transparent"` - we need this parameter, otherwise in IE, you can't have anything overlaying your video - Matt found this on the Dobbies site, where his overlay menu was hidden behind the BC video. It's fine to have `wmode value="transparent"` as a default setting for all our players, as it works fine in all browsers. 

* The default size for players is 486px x 412px (e.g. if you quick publish a video, these sizes will be included in the code BC generates). But you can change these dimensions in the BC code if you want (in the width and height params), or just control the player size using your CSS. 

#####16:9 ratio

With the video-container div we used in Clinique, we set: 

	height: 0;
	padding-bottom: 56.25%;
	
This is based on a common technique whereby we set the height of a div based solely on the padding-bottom value (which is relative to the width of a div). 

This technique is often used when you have to set the height of a div that only has an absolutely positioned div inside of it (and so would not have a height, as it's child element is out of the flow of the page). 

For example, if you set height: 0; padding-bottom: 100%; you'd end up with a square shape, as the padding-bottom would be relative to the width).

So in our video-container div, we are setting a height on the video-container despite it only having an absolutely positioned video object within in. 

The padding-bottom: 56.25% means:

* the height of the video container will be 56.25% of it's width
* meaning the video container div will always maintain the 16:9 ratio that videos have, no matter what the width.
* So it's scalable. We didn't set a width for the video-container div, meaning it takes up the width afforded to it by its parent div. But no matter what the width, the height of the div will scale accordingly due to our 56.25% declaration. 


