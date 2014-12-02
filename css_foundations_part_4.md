##CSS Foundations Part 4

###Floats

W3C defines a float as `a BOX that is shifted to the left or right on the current line` - and it also says that the most interesting thing about a float is that content flows down the side of a float (so if you float a box left, content flows down the right of that box).

#####Float values
* None (default value)
* Left
* Right
* (Inherit)

Floats remove elements from the NORMAL flow of the document. E.g. if you had a: 
`<img><p>`
- the img would naturally stack on top of the p, as the p is a block level element. However, if you add float left to the img, it would be removed from the normal flow of the document, and would appear alongside the p.

<http://jsfiddle.net/chrisonside/3srh1end/>

###Clear Fix
If a div contains just floated elements, the div will collapse to 0 height, as it contains only floated children, and the browser doesn't account for the height of the floated elements. 

So for instance it would collpase to only what the padding of the div itself was. Or if you had an h1 inside your div that wasn't floated, the browser would workout the padding of the div, plus the margin and height of the h1 inside, and that would be the height. 

But if you do have only floated elements, and you want to force the div to contain all the floated elements, you use the CLEAR property.

#### Clear values
* None (default value - allows floating elements on BOTH sides)
* Left (allows no floating elements on the left side)
* Right
* Both (no floating elements are allowed on either the left or right sides)

**The clear property clears the space around the floats**. Clears and floats complement each other and there are several float clearing methods we can use. 

The several float clearing methods:

1). Adding an element to the markup and then clearing it in the CSS. e.g. In our html, before the closing div tag, add a `<br>` tag, to which in the example on treehouse we then gave the styling `clear: both;` (we used both as their example had left AND right floated elements above the br tag). 

However, this method involves adding non-semantic elements to our code, and it clutters the mark up. So not a great approach. 

2). Apply overflow property to containing div, with the value of auto or hidden.

This is a simple & effective way to clear floats, but not the recommended way - as scroll bars might appear, or some content might get cut off. 

3). Use a Clearfix (also known as Micro Clearfix hack - <http://nicolasgallagher.com/micro-clearfix-hack/>)

It uses before and after psuedo elements to generate empty content via the content property. Then it styles the content by displaying it table - table creates an annoymous table cell and a new block formatting context which uses the before psuedo element to prevent top margins from collapsing. The clear property is then used below on the after psuedo element, to clear it on both sides. 

Common names for the clearfix class are group, clearfix, cf - but group is the most semantic class name, as we are using it to contain or group the elements within the parent.   

	.group:before, 
	.group:after{
		content: "";
		display: table;
	}

	.group:after{
		clear: both;
	}

	/*To ensure consitency for ie6 & ie7, add rule below which uses zoom to trigger 'has layout' */
	.group{
		*zoom: 1;
	}

So now anytime we need a containing element cleared, we just add the class group to that div.

	<div class="group">
		<img class="floated" src="flag.png">
		<h4 class="floated">Test</h4>
		<p class="floated"></p>	
	</div> 

Here's my jsfiddle of this in action: 
<http://jsfiddle.net/chrisonside/yteoqLqz/>

#Positioning properties

Now we understand the box model, it's much easier to understand position properties - whereby we position elements IN the flow of the document using top right bottom left position properties. 

The postition prioperty can accept four values: 
* static
* relative
* absolute
* fixed

####position: static;

By default, html elements are position: static - this means the element is positioned according to the normal flow of the page i.e. the default way in which browsers display html elements. 

A position value of static (according to w3c spec) is a normal box laid out according to the normal flow of the document, and it ignores any values for the left, right, bottom and top properties, as well as z-index. `So, UNLESS we specify a position value on an element, it will always be STATIC.`

####position: relative;

Relative positioning behaves similar to static positioning in that it changes an element witout influencing the layout of other elements. 

It positions an element relative to its position in the document flow. So we can use the top right bottom left positioning (offset) properties to say how far to move the element from where it would have been in the normal flow. 

So position relative offsets an element relative to its original position in the document - but without pusing other elements around. 

Note that you can have negative offset values (e.g. top: -20px;)

<http://jsfiddle.net/chrisonside/dbv3cwkn/>

####Position: absolute;

When absolute positioning is used, an element is completely removed from the normal document flow, and as a result, it no longer affects the position of other elements - though if you add position absolute to a box element, the space it took up is no longer honoured, meaning other elements shift up for instance. 

When an element is absolutely positioned, the offsets we set are relative to the browser viewport - unless we give a surrounding div relative position (meaning it becomes the `positioning context`)

The absolute position will always be relative to the first parent element that has a position other than static (if no parents do, the the browser viewport is the positioning context).

This means that we can absolutely position elements inside of absolute position elements. 

<http://jsfiddle.net/chrisonside/xqzbn61a/1/>

####Position: fixed;

Position fixed is another positioning method which is similar to position absolute, but there are a few differences. A fixed position element will always stay fixed in the same location regardless of the broser window or if we scroll up and down the page. 

A great example is the Twitter header, which always stays fixed to the top of the viewport.  

Fixed positioning will always be relative to the viewport - even if we add position relative to a parent, the  positioning context will never change. 

<http://jsfiddle.net/chrisonside/d9317crt/1/>

##Z-index

Z-index property allows us to change the natural stacking order of elements, by adding a third dimension to a page, by setting the stack order of elements on the z axis.

So higher z-index values sit on top of lower z-indexes and move towards the front of the page.  

Z-index property can only be applied to elements that are positioned relative, fixed or absolute. 

<http://jsfiddle.net/chrisonside/mqxtqt6u/1/>


`YOU CANNOT APPLY BOTH A FLOAT AND POSITIONING TO AN ELEMENT, AS IT CREATES CONFLICTING POSITIONING SCHEMES.`















