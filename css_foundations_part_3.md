#CSS Foundations Part 3

##The Box Model

Every HTML element, no matter how big or small, **can be thought of as a rectangular box made up of content, padding, borders and margins**. 

**The Box Model is the basis of CSS layout and positioning, and it dictates how elements are displayed and interact with each other**.

A key thing to consider is whether elements are block or inline elements. e.g. h1 is a block element. strong is an inline element.

An inline element only takes up as much room as it needs. Examples of inline elements are span, image and anchor elements. 

A block level element takes up as much space afforded it, and forces a new line. e.g. div, h1, p.

The box model is made up of 4 distinct parts which determine the element's size: 
content, padding, border, margin (which appears outside the box, to separate it from other elements).

In the metrics tab of inspect element, you can see the box settings for each element. 

**Padding** - can be expressed as a length (in pixels) or a percentage. But you can't have negative values for padding. 

**Border** - can also only have positive values (or keywords like thick), you can also set color and style (e.g. solid). The default value is none.   
* If you want, you can set individual styles or colors for the border on each side of the element's rectangle - e.g. `border-color: red blue green yellow;`

**margin** - accepts percentages, lengths or the keyword 'auto'.  
* You can use negative values on margin  
* When you apply a negative margin to the TOP or LEFT margins, that will pull the box in that direction - e.g. margin-top: -20px; will pull the box in that direction (and 20px outside of it's containing div if there is one that's tight around our element).   
* However, if you apply a negative margin to the BOTTOM or RIGHT margin, this will pull any SUCCEEDING element into our element.   
* With the 'auto' value, the BROWSER calculates the margins availabe in the parent div. But auto only works when our element has a width too. (otherwise it will just fill all the space in the parent div, and there won't be a margin for the browser to calculate).  
* Note that margin-top and bottom will not have any impact on lots of inline elements - you'll need to change their display to block or inline-block if you want margin-top and bottom to have an effect. 

####Width height & overflow (what happens when content overflows its containing div) properties

We can overwrite the default display status of an element using the 'display' property e.g. none, inline, block, inline-block

**none** - it disappears, and doesn't take up any space on the page anymore. 

**block** - default value for block elements, and makes them generate a block element box with a line before and after it. 

**inline** - element stays in the flow of the line (e.g. anchors are default inline).   

* If you wanted to apply a `width or height to an inline element`, you need to declare it `display: inline-block;` - n.b. only padding and margin left and right will work on inline elements - padding/margin top and bottom do not have any effet on inline elements. 

* Note that negative top and bottom margins can not be applied to inline-block elements. 

**inline-block** generates a box that's a block element but that's still flowed with surrounding content as if it were an inline-element. 

	**Inline elements**:
	respect left & right margins and padding, but not top & bottom
	cannot have a width and height set
	allow other elements to sit to their left and right.
	
	**Block elements**:
	respect all of those
	force a line break after the block element
	
	**Inline-block elements**:
	allow other elements to sit to their left and right
	respect top & bottom margins and padding
	respect height and width


A similar property to display: none is **visibility: hidden;** - this is different though as it still affects the layout as if the element was still there. 

Be default, a box's width and height is as wide or as tall as the content it holds. But we can set widths and heights to override this. 

If you had a div that you wanted to fill the whole height of the page (even if the content only filled half the height), you'd need to not only set height: 100%; on that div, but also it's containing divs (e.g. body and html)

####Content Box Model
Traditional Box Model of CSS 2.1 = calculation for width (or height) is width (content) + padding + border + margin

But a new CSS3 feature is:  

####Box-sizing: border-box;  
Now if you `declare a width or height for your div, all of the other box properties are now included inside of this width or height (instead of expanding it)`. 

This is really helpful if you want something to always be say 500px or 50% of your page no matter the padding, border etc. It `means you don't have to do any complex sums to work out what you should declare your width as`.   

* FFox needs a vendor prefix -mox-box-sizing: border-box;
* IE7 doesn't support it - IE8 upwards does.

**Other properties:**   
**Min-width** - specifies the minimum width a box can be when the browser is narrow.   

Likewise **max-width** specifies the max width a box can be when the browser is stretched wide. 

You can also do the same with `min-height` (height will never be less than 300px for example, even if the content doesn't fill that space - if content extends beyond 300px then it will grow with the content) and `max-height` (often used in conjection with the `overflow` property - values can be visible (default value - where content will flow out unless you declare one of the following): hidden (can't see any content beyond the cut off point), scroll (add horizontal and vertical scroll bars), auto(scroll bars will only appear when needed). 




