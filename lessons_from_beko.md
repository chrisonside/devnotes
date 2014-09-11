#Lessons from Beko

##Vertical align only works if both adjacent divs have it

So if you have two divs next to each other in a parent div, the vertical-align middle on the tags within those divs, will only work if the vertical align is repeated on the tags in **both** divs.

##Brightcove API & building custom video players
If the design incorporates some kind of custom video player, such as a large (selected) video, with thumbnail videos underneath, this can either be done by the design team building a custom video player in Brightcove, or alternatively, Rich has built a player with his own code previuosly, using the Brightcove API (he is sending me an example). 

In my project, I'd started working on the video section ahead of when I should have been working on it.  I should have left that section out and come back to it, rather than start putting a basic layout in for it (as in doing so, I was forcing a decision on how the video player would be built, onto whoever was building the video player).

##To go responsive, I just need a max-width once, on the body for example. 

In my proposed code, there were about three or so pointless divs in the beko-layout.php file, all purporting to do the same thing. I deleted a couple of them, and just had a max-width 980px on the body instead. This was all I needed to make my site responsive. 

##Use Cmd + p 
Don't search for ages in sublime for you folder. Cmd + P and you are there. 

##Design don't normally need to create thumbnails for me
Usually the thumbs will just be scaled down versions of the main image, and I can create and fetch these from MediaBank using an array command after the image call. 

##Avoid terms like $cleanArticles in the view
Terms like $cleanArticles work well in the logic, but when you pass them through to the view, they should now be just $articles - having the word clean in does nothing in the view, and can overcomplicate or confuse when styling. 

##Background size controls background image size - good to remember if using retina background sizes. 

So I had a background image that was twice the size of my body max-width (for retina reasons). At first, it looked rubbish as the image was coming through at full size, and so in my view area I could only see part of my background image. But I added `background-size: 100%;`, and it meant that the image then scales to be 100% width of the container. Problem fixed. 

If you are very worried about serving larger images to mobile (this wasn't such a worry on my project, as Rich said it was very unlikely that my site (being piped into House2Home) would work on mobile anyway), there is a technique whereby you only serve the retina image for machines that can make use of them - and serve a smaller image for those that don't. <http://css-tricks.com/snippets/css/retina-display-media-query/>

##Use inspect element to see a sites number of requests and download size. 
House to Home was 285 requests and 3.2MB download - so I didn't need to be too worried about my main image for my iframe into House to Home being 200K big. 

##Negative margin left and top for gutters in grids
These are for grid gutters, look at how I implemented them in Beko for an example. Also look at Rich's grid code too. 

Also when using grids, Rich had put font-size: 0; in the grid class - this is to stop the space between the gi items. Remember, I will have to accomodate for this in my code, and set a font-size for the elements in my grids (otherwise they will be zero font size).

##When doing JavaScript, always first consider how people without Javascript will see things. 
So I had a main div at the top with a kitchen image, and then several touchpoints laid on top, which had accompanying divs appear when clicked upon. The show and hide of these divs would be done with JavaScript, but to make the site accessible (and look good) for those who disabled JavaScript, I stacked the divs horizontally under the main image (with 25% width each), and gave them a header each so that they'd make sense as a standalone element (when not next to the touchpoint) - then if js was enabled, I removed the headings, hid all but the inital div, and added the correct positioning for each div. 

##When considering if something should be a background image or normal image…
Consider whether it belongs in the content of the page. If it's just decoration, backgroudn is fine. But if the page would make much more sense to a screenreader for instance if the image was there, it belongs in the content.

##When using the translate -50%…
Remember that translate means move something relative to itself! On the other hand, if you position something absolutely, that's positioning it relative to its parent.

##When it comes to things like buttons and touchpoints, use CSS, not images! 
I was able to make a great circle button with a border, plus sign and hover states in CSS, whereas before I'd used images for that sort of thing. 

##Don't use camel case in CSS! 
Only use hyphens for CSS class and ID names

##If using SASS - check your resultant CSS too! 
You should have your style.css file open to see that your SASS is getting rendered properly. Don't just ignore it and hope for the best! 

##Typography
The typography SASS file can also include font sizes! It makes sense to find all the type decisions in there.  

##When it comes to transitions, you can name various properties, and stagger those transitions
E.g. 
`transition: opacity 0.5s ease-in-out,
				z-index 0s 0.5s;`
I used this code as I wanted the z-index to kick in after my opacity had done it's stuff (to avoid a jumpy effect). 

##Jquery notes

First off, jquery should be called at the bottom of your template page - you only put script tag calls in the head that are critical to your page, such as Typekit - you want Typekit in the head, as this stops the page loading with rubbish fonts (and having to wait for it to then flick over to look nice when the fonts load in). 

There were a couple of ocassions I had to make things jquery objects, e.g. `$(this)` or `$(anchor)`.

You can edit the DOM with jquery, for instance you can `.prependTo()` or `.appendTo()` divs. 

The foreach loop in jquery is as follows, using an example of looping through all elements with a class of .touchpoints: 
`var touchpoints = $('.js-touchpoint');  
$.each(touchpoints, function(i, item){
	// Code goes in here  
});`

You can pass things into a foreach, in this case we passed in i and item. 'I' will be set to the number of the loop, item will be set to the item that's being looped over. 

If you've created an annoymous function where you want to prevent the default behaviour, to **prevent that default behaviour** (such as scrolling down to an anchor or clicking through to a link), pass e into the annoymous function and then apply the preventDefault() function to e. e.g.   
`whatever.click((e){
	e.preventDefault();
	// Then the rest of your code
});`

When it comes to naming conventions: 
* Use js-classname for js-hooks only! (don't use them in your CSS styling)

If you find yourself repeating code, or if it's getting bloated, set variables and use them. 


##A few cool jquery things
For things like showing and hiding, I set and removed classes. This was pretty cool as it allowed me to set the styling in my CSS, and then just apply and remove in the jquery. 

`$(this).parents('.touchpoints')` - the parents function will go up the DOM tree until it finds that element, even if it's not the immediate parent. 

If you have jquery array (e.g. var navitems), to grab the first element in the array, you use navitems.eq(0);

##Onclick commands
I used `on click` commands quite a bit. And another key term was `delegate` - whereby you delegate the effects of clicking on an element, onto another DOM element. So in this for instance: 
`nav.on('click', 'a', showModelDetail);` - says that when you click the nav item, target the a within the nav div and call the showModelDetail function. 

However, you don't always needs to delegate. Just leave out the second selector and it will listen for clicks on the element only. e.g. 
`img.on('click', function(){ console.log('Blah'); });`

##You can edit the DOM with jquery. 
I did this in my code for Beko - using appendTo, I took corresponding divs from lower down the page, and appended them to touchpoint buttons at the top of the page when javascript was enabled (this worked well, as if javascript wasn't enabled, the divs stayed in their starting place lower down the page, and were visible (although not as pretty) to those users who didn't have javascript enabled).


##Don't be unnecessarily specific with my jquery. 
So I had a lot of `$('.accordion > h4')`, but then if I changed my mark up to have a div in between accordian and the h4, my jquery would suddenly not work. So unless I wanted it that specific by design, I should have had `$('.accordion h4')`...

##REMs break ie8
So if you use them, you need to provide an ie8 fallback - use the cascade for this. So if you have 1rem, and 1rem is 16px, you need to provide a regular font-size as the ie8 backup:
`font-size: 14px; /* IE8 fallback  
font-size: 1rem;`

##Remember to input prefixes for things like translate
The lack of an -ms- prefix meant that in IE9 my translateY 50% trick to vertically align stuff wasn't working. Adding in the correct prefixes worked. 

##ie8 doesn't like nth-of-type in jquery
So I had to refactor my jquery to fetch elements in a different way to nth-of-type. 

##Console logs break ie9
Remember to take them out! 

##My jquery was breaking the iframe solution - unnecessary animations and position of resize function were confusing the browser. 
So, I had a paragraph sliding in on the page load - which was unnecessary, and also confused the browser which was trying to also apply the jquery resize function that the devs at IPC came up with to iframe sites into our websites (this one was House to Home). 

To fix things, I first showed the paragraph in question from the very start (using show() rather than slideIn() - remember, whenever you add an animation to a page, you are adding to the complexity, as you are asking the browser to repaint how everything looks. This repainting can also slow everything down. 

The other thing I did to fix things, was to put the resizeIframe() function at the end of my jquery - this meant that the clearing space for my iframe only happened once the browser had whizzed through the other jquery and decided how tall my page was and therefore how much space was required. 

So in summary, I fixed it by thinking about the flow of jquery functions, and by making my site more static in terms of aleviating unnecessary animations.  

##Whenever I clone an IPC project from github, I need to run composer install, to fetch all the dependencies, such as IDA (and the helpers)

##If you have an inline-block with no set width…
Such as in my project, where I was using Rich's grid system, and where I had a gi div which was inline block, but which had no set width, and which contained a retina image - in firefox and IE the image ballooned to full size - it needed width 100% set to give it a width and stop it balooning. 

##To remove whitespace changes from diff in github
This helps you view diffs more easily - add this to the end of the guthub URL - ?w=1 

##The Beko project
Was unlikely to work on mobile Rich says, so I didn't need to worry too much about it. We discussed sending it across as a standalone campaign site (not iframed in) to begin with, and it would have been fine to put a width on the site (rather than a max width), to prevent the client coming back and saying it looked bad when they resized their browser. But in the end we got the iframe working, and with house to home being a non-responsive site, it wasn't an issue. My approach to positioning touchpoints using percentages was a good one, and worked pretty well when it went to the smaller screen - so if I have time, I should make sure that my site looks good as a standalone piece too that could be viewed on a mobile. 

##Key lesson is to make sure I know what assets I need early - and then chase them up early too
So don't be asking for assets on the day! And I should know at the very beginning exactly how much content needs to be added - and I should keep track of what content I have been provided with, and which I still need. 