##CSS Foundations Part 5 - Treehouse CSS course

#Borders and Backgrounds

Every html element has a background layer that is transparent by default. Everything bar the margin area is considered the background. You can of course style the background. 

So you can specificy a background-color for instance (to override the default transparency). Or you can add a background-image for instance (see below) 

####background-image

Uses URL functional notation, so:   
	
	background-image: url('image.jpg'); 
	background-color: #efefef;

Good practice to also specifiy fallback color, in case background image doesn't get served. 

<http://www.subtlepatterns.com> - free resource for background patterns. 

`If the image is part of the actual content, and conveys important information, e.g. the main image for a news article or contextual blog post images that relate to the content, then it's best to inlcude it as an inline image element in the markup. That way you can also specify alt text, in case the image doesn't load.`  

`By default, background images are tiled horizontally and vertically` - if you don't want the image to repeat, you must specifiy this. Use the `background-repeat` property.

######background-repeat
So the default value for background-repeat is repeat.  You can use repeat-x and repeat-y instead if you want, or no-repeat. Images near the edge of the div will be clipped (they won't force the div to change size).

######background-position
`By default, a background-image's default position is top left`. You can use `background-position` to control this. 

Background-position accepts position keywords along with length units and percentages. 

	background-position: center/left/right (first declaration on background-position pertains to the x axis) top/center/bottom (second declaration pertains to y axis)

If just one value is specified, e.g. center, the browser will assume that goes for x and y. 

When we use percentages, the values are relative to the width and height of the positioning area. So: 

	background-position: 80% 50%; 
would be 80% to the left, and vertically aligned. 

If you have a negative offset, the background image will move outwards rather than into the background positioning area. So: 

	background-position: -100px 50%;
	
would cause the background image to be vertically aligned, but some of it would be cut off as the offset would take it off to the left. 

####Background-attachment
 	 
This property allows us to specify whether the background image scrolls along with the containing element & content, or whether it stays fixed to the viewport area and never moves.

**scroll** is the default value. So the background image scrolls with it's containing element. So it moves up and down the page with everything else. 

**fixed** says that when the user scrolls up and down the page, the background image should stay static (the text on top of it would scroll fine though).

**local** - new property. Quite cool, not quite supported in Firefox yet. 


##Background shorthand
	background: background-color background-image background-repeat background-attachment x-axis y-axis;
	
For any that we leave out, the default values will be used. 	


##Border Radius

We can safely apply to most elements - chrome and safari though won't apply border radius to Video elements. Ie9 and above are fine. 

You can use border radius to decide exactly how rounded the corners are.

Even if the element doesn't have a border set, the border radius can still be applied if the element has a background property set. 

border-radius is actually the shorthand for border-top-left-radius, border-top-right-radius etc. You can give border-top-left-radius etc either length (e.g. 30px) or percentage units. 
 
Negative values are not permitted for any length units or percentages when it comes to border-radius. 

A border radius can either be a circle, or an ellipse (two values). When two values are used, the first is the horizontal radius, and the second is the vertical radius. The two values combined define the curvature of the corner. 

If you are defining the border radius for each corner of your shape (i.e. the longhand way), you can picture each corner of the shape as having either a little circle or elliptical shape wedged in the corner - the dimensions of these little shapes determine what the curve of the corner is like - and the dimensions of these little shapes are determined by what you set in the longhand border radius declarations (e.g. border-top-left-radius: 80px 40px would be an elliptical shape which had a radius of 80px (horizontal) to 40px (vertical)).

If you are using percentages for the border radius, these relate to the width and height of the box being rounded. So border-top-left-radius: 50% 20%; of a box that was 100px x 50px would effectively be border-top-left-radius: 50px 10px. 

'Rounded corners are formed from the radius of a quarter circle, and elliptical corners are formed from the radius of a quarter ellipse.'

####Short-hand border radius

One value = applied to all corners  
Two values = first value is applied to top left and bottom right corners, second value is applied to top right  and bottom left corners.   
Three values - first value applies to only the top left corner, second value applied to top right and bottom left corners, third applies to bottom right corner only.  
Four values - clockwise from top left corner. 

	border-radius: 30px 0 60px 80px;
	
If you wanted the same two values (for horizontal and vertical radius) for each corner, you use forward slash: 

	border-radius: 50px / 100px;
	
Or you could set different horizontal and vertical radius for your top left and bottom right, and then your top right and bottom left corners: 

	border-radius: 50px 100px / 25px 50px;
	
####Interesting shapes using border-radius

<http://jsfiddle.net/chrisonside/4dmtj12o/>

##Drop Shadows and inner shadows using Box Shadow

	box-shadow: **horizontal-offset** (can be any CSS length unit, and can be negative (moves shadow to left) or positive (moves shadow to right) **vertical-offset** (positive = moves shadow down, negative = moves shadow up) **blur-radius** (optional - says how blurry or sharp shadow should be. 0 = sharp edges, wheras 30px would be blurry) **spread-radius** (optional too - positive means shadow expands by radius quoted on all sides. Negative causes shadow to shrink) **color** (of the box shadow, we can use rgba value here for opacity - e.g. rgba(0,0,0,.8) - color value must be placed before or after the length values, or the line is ignored - if no color specified, the browser renders the shadow according to the element's color property).
	
	box-shadow: 0 20px 30px -10px rgba(0,0,0,.8);


By default, box shadows are created as drop shadows outside of the element. To create shadows inside, we add a value of `inset` (must be declared first or last or the line will be ignored):

	box-shadow: inset 0 10px 10px 5px rgba(0,0,0,.8);
	
	To inset the shadow evenly, set the offsets to zero (we'll remove the rgba for this example too):
	 
	box-shadow: inset 0 0 6px 4px;
	
You can apply mutiple box shadows to a div - read up on how to do this! 

Box shadow supported by all the major browsers 

#Advanced Backgrounds

###New CSS3 background properties

####Multi layered backgrounds
With multiple backgrounds CSS3 feature we can build muti layered backgrounds using the background property. It's as easy as separating each background value with a comma. 

e.g.
 
	background: url('img/smiley.png') no-repeat right top, url('img/pencil.png') no-repeat left bottom, url('img/texture.jpg') #efefef;
	
Note that the first layer mentioned in the CSS line will be the top layer out of all those mentioned (one that appears last in the CSS is the bottom layer).

So if you had the first layer in the CSS line as a solid color with no transparency, you wouldn't see the other layers! 

####Background-size
Used to set the size of background images. 

We can set the size using length values, percentages, or two new keywords - **cover** and **contain**

So using the same example as above: 

	background: url('img/smiley.png') no-repeat right top, url('img/pencil.png') no-repeat left bottom, url('img/texture.jpg') #efefef;
	background-size: 30%, 40%, 110%;
	
So that would mean that the first background layer (the smiley.png) is 30% the size of the entire background area, the pencil image is 40%, and the texture image is 110% of the entire background area (it would get clipped). 

You can set the background size in pixels if you like - you can either state two values per layer, e.g. 300px (width) 200px (height), or just state one value (width) & height is set to 'auto' by default in that situation. Negative values are not permitted. 

This is a great property, as it means we can edit backgrounds super easily without having to go back into Photoshop and resave images - we can do it all in the stylesheet.

**We can also add background-size into the background shorthand**
	
	background: url('img/smiley.png') 350px 200px / 250px 200px no-repeat, url('img/pencil.png')…

We just insert a forward slash between the background position / background size values. 

But Safari and Firefox don't support these values when in the shorthand form. 

`Asides from length and percentage values, the background size property has two new keyword values that ensure our background images will display entirely at a scaled size - really good for creating full page background images`.

We want to scale the image, to make it fit within different window sizes, whilst still preserving its original proportions. We can do that using the `cover` and `contain` keyword values.

####Background-cover
If you use 'background-cover' make sure that height is set to 100% in your CSS for that particular element. 

'Cover' adjusts a background image to fill the entire background positioning area and scales it so that both its width and height can display proportionally. 

####Background-contain
If you use 'contain', the image will be scaled to the largest size it can be whilst retaining it's dimensions - so you might end up with white space to the sides or top or bottom.   
"background-size: contain; will scale an image so that it fits entirely inside the background area, while keeping its original aspect ratio."

####Background-clip
Tells us how far the background image should visibly extend. 

Often used in conjunction with background-size: cover;

A background by default is everything in an element's box, bar the margins. However, if we had transparent borders and were able to see the background image under these borders, we could supress this using background-clip property. 

Possible values: 

* `border-box` (default - background is clipped to the border box of our div)
* `content-box` (background is clipped to the content of our div - so doesn't include border or padding areas of our div)
* `padding-box` (sets the background within the padding area - this looks great, and no image shows behind our transparent borders.)

###Background-origin
Property to determine how a background position is calculated. 

The three values are identical to the ones above, so `border-box`, `content-box`, `padding-box`. 

So if you have padding box, the background position is relative to the padding area. 

Background-origin is often used in conjunction with background-size: contain; (you would take out the background positioning from the background shorthand to see this in action.)

N.b. If background-attachment value is set to fixed, this property will have no effect. 










 





  	 
 	





