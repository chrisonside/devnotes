#CSS fundamentals - Treehouse - Part Two

##Values and Units

###Absolute Length Units
When specifying a number as a value for a CSS property, you have to give it a unit of measurement too, such as pixels, rems, % etc.

Units can either be relative, or absolute (absolute usually specified in pixels)

A CSS pixel equals one point on our virtual grid to which our designs align. A pixel is equal to 1/96 of 1 inch. 

Note that Pixel size remains the same - pixel size does not scale depending on the users' browser resolution. However, pixel densities are increasing across browsers (e.g. on Macs).

To help designers have their designs look consistent across browsers, they can reference THE REFERENCE PIXEL - the standard for all pixel based measurements. It works by defining the visual angle of one pixel on a device with a pixel density of 96dpi. This should ensure that pixels look the same across browsers, no matter the pixel density.

###Relative Length Units
These specify their length relative to another length - e.g. relative to font-size or the width of browser viewport (incidentally both useful measures, as these relative units have consistent results across multiple devices and screen resolutions - so they are great measures to use on screen design). 

#### em unit
* If we haven't set font size anywhere in our html, the default will be 16px (browser default)
* So by default, one em is 16px, two ems are 32px. 
* If we set font-size for html selector (in our CSS) to 1em, this is the equivalent of setting it to 16px. 
You can use ems for setting font sizes or even widths of elements
* e.g. if html font-size was 1em, and you set .box{width: 30em} - that width would be 480px.
* The em is very popular in CSS, as it can adapt to the font size which the user chooses to use. All of the other em widths and font-sizes will change as the user selects a different em size. 
* Key consideration though, is that there is a COMPOUNDING affect in nested elements - element's em sizes are relative to what's been set in their parents CSS (or what em sizing their parents have inherited).   

As compounding can prove tricky when doing your CSS, especially if you are using mulitple font-sizes, there is a new measurement called: 

####Rem unit
* Stands for Root Em
* ALWAYS relative to the font-size of the ROOT ELEMENT of the page - usually the HTML element. 
* If a font-size is specified for the html element then ALL Rem units are relative to that font-size
* This avoids the compounding effect, very useful! 
* (If you had a mix of rems and ems, with 1em set as the html font-size, as that means the browser default of 16px, all Rem units on the page would be relative to 16px). 
* IE9+ support REM unit - IE8 we can create a SASS mixin to automatically add the font-size fallback. 

####CSS also recently added Viewport-relative units:
* vw, vh, vmin - currently a working draft in the CSS w3 spec
* These eliminate dependancy on parent elements, and resize elements purely based on viewport size. 
* `These will become more common as browser support catches up`

###Numerical & Textual Data Types
* **Auto** - means the browser automatically calculates that value
* E.g. if you had specified a block level element with a width, and then said auto for the margin value, the browser would calculate the right and left margins to be equal, and so the div would be centered in the available space on the page. 
* **Inherit** - can be used on properties to specify that the value of the property should be the same as its parents. E.g. anchor elements don't inherit color of their parents, but if you really wanted to set it the same as it's parent, you could use inherit
* **Initial** - the initial value is the value that is designated as the property's initial value - so it goes back to the intial value the element would have if no styles were applied.  e.g. if you had strong{color: initial} - it would revert back to the default text color of black, no matter if it had a parent saying otherwise. Firefox needs a moz vendor prefix, and IE doesn't support initial. 

####Other units include
**Numbers and integers (whole numbers)**    
* These can also be negative numbers - the CSS properties that allow negative units include margin, background-position, text-indent, and the position properties (top right bottom left).

**Percentages**   
* These values are always computed relative to another value, usually a length unit.   
* Common properties that use percentages are width, margin, padding and font-size.   
* If using percentages for font-sizes, the size of the font will be relative to the font-size of its parent element.  

##Color Values
Can be set using:   
* keywords (red, lightblue, tomato etc)  
* hexadecimal codes (#efefef) - combo of red, green and blue values. We can abbreviate these, and not just ones like #ffffff - we could also abbreviate #eeff11 for instance.   
* RGB method (red, green, blue) - e.g. (65,105,255) - this can be extended to allow opacity via the alpha channel, by adding the alpha value and making it rgba - rgba(65, 105, 255, .9). Note that RGB values range from 0 to 255  
* Also the lesser used hsl(240,70%,55%) - hue, saturation, lightness - again can extend it to be hsla to allow for opacity. 

##Font properties
**Font-weight:**   
* Font-weights range from 100 to 900 (you can quote these values). 
* Normal = 400
* Bold = 700
* Headings are by default bold, paragraphs are by default normal
* You can also use 'lighter' or 'bolder' which wil set the font's weight lighter or bolder than it's parent (where it's inherited the font-weight from) - this doesn't work on some fonts though, which may only support a few font weights for instance. 

**Font-size:**   
* Can use keywords like 'small'  
* Relative terms like 'larger'  
* But it's most often in:   
* Pixels, Percentages, ems, rems.  
* W3C recommends that we should use ems or percentages, to have more flexible font sizes that adapt according to the users default browser font size

**Font shorthand:**  
* `font: italic small-caps bold 1.5em, georgia, serif;`  
* Font size and family must be specified, or the shorthand must be defined, or the line will be ignored. Also order is important, and font-family must be the last declaration.

**Line-height**  
* Specifies the vertical spacing between lines of space  
* The difference between the font-size and line-height is the ledding - this is measured from the bottom of the descendor to the top of the ascendor on the next line.   
* Very common (and good practice) to define line-heights in ems, percentages or unitless value (e.g. 1.5 - which is 1.5 the font-size - so effectively the same as 1.5em) - these all scale depending on the font-size.

**White-space**  
* The default is 'normal' - also means that if there's loads of white spaces in your mark up it won't render them (it'll just render one space)   
* 'nowrap' - ignores line breaks, thus stopping the natural flow and means it just collapses to a single line  
* 'pre' - white space is honoured exactly as it is in the mark-up (even if you have lots of line breaks and random white spaces in the mark-up, using pre means they will be rendered exactly like that on the page).  
* 'pre-line' is better - ignores the multiple white spaces, but honours the line-breaks you've put into the mark-up.   
* Finally 'pre-wrap' - read up on this if I want to use it. 

####New CSS Text Properties
**Text-shadow**  
Accepts up to three properties & a color  
Horizontal offset - so how far to the left or right the shadow should fall  
Vertical offset - as above but how far to the top and bottom  
Note that both horizontal and vertical offsets can be negative values - this sets the shadow to the left and top, as oposed the right and bottom (as you get with positive numbers for the offsets).  
Third property is optional - the blue radius, so how much blur should be applied to the shadow  
Finally the color - this can be hex code, rgb, rgba etc. 
`text-shadow: 1px 1px 4px #000`  
You can stack shadows on top of each other - the one declared first in the CSS line will be the one that appears on top on the page.  
`text-shadow: 1px 1px 4px #000, -2px -1px 2px #efefef;`

**Text-overflow**  
Says what should happen should you get text that overflows it's containing div. You'd first have to declare:   
`overflow: hidden` - and then give a visual clue to the reader that the text is not complete, e.g. `text-overflow: ellipsis`

**Word wrap**  
This is useful for if you have a really long link that is breaking out of a div - just add `word-wrap: break-word;` to the link, and it will break nicely over lines (rather than be one huge line that flows out of a div).

####List style types
* There are all sorts to choose from, such as circle, disc, square none etc.    
* A great one to try (for emails in particular) is on the list styles, `list-style-position: inside;` which places the bullets inside the content, as opposed to outside as in the default. 
* By default, lists are indented into the page - `IE uses left margin to control the indentation, whereas Firefox, Safari and Chrome use left-padding`. 
* List-style-image allows you to replace bullets with an image - however, it doesn't allow for great placement of the bullet, so more popular is to do list-style-type: none on the list, and then for each li add a background image e.g. `background: url('marker.png') no-repeat 0 2px` - gives you more control over the position this way. 
* `list-style` - shorthand declaration to declare all the properties in one go. E.g. in the ol, `list-style: decimal-leading-zero outside`
  

