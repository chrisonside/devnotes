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

##When doing JavaScript, always first consider how people without Javascript will see things. 
So I had a main div at the top with a kitchen image, and then several touchpoints laid on top, which had accompanying divs appear when clicked upon. The show and hide of these divs would be done with JavaScript, but to make the site accessible (and look good) for those who disabled JavaScript, I stacked the divs horizontally under the main image (with 25% width each), and gave them a header each so that they'd make sense as a standalone element (when not next to the touchpoint) - then if js was enabled, I removed the headings, hid all but the inital div, and added the correct positioning for each div. 

##When considering if something should be a background image or normal image…
Consider whether it belongs in the content of the page. If it's just decoration, backgroudn is fine. But if the page would make much more sense to a screenreader for instance if the image was there, it belongs in the content.  