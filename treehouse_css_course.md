
#Treehouse CSS course

Handles presentation layer of a web page. 

Introduced in HTML 4.0 in 1996. 

HTML is just structure of a web page - it's vital to separate the presentation layer, as then you can maintain things easily and share that CSS across multiple web pages. 

##Current situation: 
* CSS 2.1 is the 'Official Complete Web Standard'
* with parts of the CSS3 spec implemented as a final standard.  
* CSS3 has introduced new features like rounded corners, box shadows, gradients, transitions and animations - also layout stuff like flex box and multi-columns

##The W3C CSS Working Group: 
* writes and maintains CSS standards
* decided to split CSS3 up into individual feature modules, that level up as full standards independently - that way, some features won't slow other features down from being implemented by browsers. This has led to certain features being adopted by browsers much quicker than having to wait for the whole CSS3 spec to be considered finished. 


##Fundamental concepts

Understanding how the cascade works - defines the order in which CSS styles are applied. 

***Think of the Cascade as a living being, which makes decisions on which CSS properties to apply to a HTML element based on the following…***


##3 main steps that the cascade follows: ISS
* Importance
* Specifity
* Source Order

###1). Importance
Depends on the origin of the stylesheet - which can come from lots of different sources. 

**User Agent Style Sheet** - each browser has it's own one of these, hence the difference in how a webpage looks on different browsers. 

**User Style Sheet** - contains styles set by a user - these can have different styles that they set which are different to the browsers default styles (e.g. accessibility -> better font size or contrasts).

**Author Style Sheet** - the CSS we create to style the HTML page. 

`By default, the author style sheets have more importance than user agent and user style sheet.`

`So first off, the cascade decides the IMPORTANCE of a CSS property. The NEXT stage assigns the:` 

###2). Specificity: 
Specificity etermines which CSS styles are applied by the browser. 

`If two selectors match the same element, the one with the higher specificity takes precedent`

The Cascade then considers: 

###3). Source Order
The Source Order is important, as the Cascade then assigns priorties to CSS styles based on which order the styles are declared. 

`So if two CSS properties affect the same element, have the same Importance and Specificity, the property that appears last will style the element.`

#####After the Cascade has determined these three things, `each CSS rule is assigned a WEIGHT`, that determines which property will be applied to an element.  

##CSS Rules
Tell browsers how to render HTML elements. 

`CSS rules are comprised of two parts: 
* Selector
* Declarations:`   
e.g. h1 { font-size: 2.5em; }

`The declarations are made up of:   
* Properties
* Values`

You can use more than one CSS selector in a CSS rule:   
e.g. h1, h2 { font-size: 2.5em; }




## CSS Inheritance
Simply that an HTML element's style values are copied from their parents style. 

e.g. if you set the font color in the body it'll be inherited by children of the body. 


## Methods to add CSS to a page

* **Inline Styles** (bad - mix content with presentation). Inline styles are at the lowest level possible of the cascade - i.e. they will override any styles set in internal or external stylesheets. 

* **Internal Styles** - these are embedded in a `<style type="text/css">` tag in the head of the page. Again a bad method to use (unless doing a quick prototype before putting styles into an External stylesheet.) Not only does this mean lots of repeated code in head tags of pages, internal styles are required to be downloaded by the browser each time a page loads.

* **External Stylesheet** - the best way, as only one file needs updating when changes to styles made. Also the CSS file is cached by browsers, meaning this will save on loading time of your styles - it only needs to be downloaded once - then you can clear the cache when you want to update the stylesheet. Use the `<link rel="stylesheet" type="text/css">` tag. rel="stylesheet" refers to the relationship between our page and the file it links to. Alternatively, you can use the `@import` statement to pull in styles from another CSS stylesheet. `You can either do it in the <head> - bad! <style type="text/css">
	@import 'css/more-styles.css';
</style>`  
###OR
`just import it directly into the stylesheet` - if you use an import statment in a CSS stylesheet then it **needs to preceed all other styles in the style sheet - so keep it at the top of the CSS file**:  
`@import 'more-styles.css';` Importing style sheets can actually help you modulize your CSS (a good thing) - I think that SASS works around this principle. ***However, using @import statements in CSS is also a performance consideration, as each import statement is a new request to the server.***

##CSS Selectors
`CSS Selectors are effectivley patterns that let us target HTML elements - telling the browser to apply styles to every instance of that selector in the HTML.` 

Selectors can be defined based on an element's: 
* type
* it's class or ID name
* or even it's position in the document

###Type selectors 
* (also known as **Element selectors** becuase we only use the element's html tags as the selector)
e.g. p, h1

* Universal selector - selects every element on the page at once. 

* e.g. you can use the universal selector to remove all margins and padding that might be different by default in the various browsers (margin: 0; padding: 0;)

* `The Universal Selector takes precedence over every other selector in a stylesheet. However, you can OVERRIDE the universal selector with more specific subsequent styles.`

* `It's important to remember that the universal selector TRUMPS any form of INHERITED STYLES styles on your stylesheet`. This can lead to lots of extra CSS to make up for the lack of inherited styles, so if the universal selector is used, the properties declared in it are usually minimal.  

We can also use type selectors to create: 
###Descendant Selectors
`A descdendant selector selects an element that is a descendant of another element.`

`e.g. h1 span{}`

So for a descendant selector you need two selectors separated by a white space. 


## Class Selectors and ID Selectors

`Used to specifically target elements based on their class and ID html attributes`.

Good practice to give classes meaningful names. 

It's great practice to `spot patterns in your design`, then create classes which can be reused and quoted multiple times in your mark up. 

An element can only have one ID. 

And a page can only have one element with the same ID name. 

`IDs carry more specificity than classes - so if an element has an ID and class, the ID styles will carry more weight and win the day`

***IDs have browser functionality*** which means that they can be used as FRAGMENT IDENTIFIERS, for creating anchors or landmarks in pages. 

e.g.  
`<div id="top"></div>` 

`<a href="#top">Return to top</a>`


## Selector Groups
Selector Groups are CSS rules containing two or more CSS selectors, that share the same properties and values. e.g.  
`h1, h2{
}`

Makes CSS more maintainable and avoids repeating yourself. 

DRY - common CSS practice (and web development in general)

###Modular CSS Rules (using meaningful class names)
`The trick is to go beyond the DRY principle, and TURN YOUR CSS RULES INTO RESUABLE MODULES/COMPONENTS THAT YOU CAN USE TIME AND TIME AGAIN, ANYWHERE IN YOUR HTML. E.G. .RADIUS, .AVATAR`


## Combinators
Explain the relationship between two selectors. 
* If you leave a space between two selectors, this is an example of a combinator, as you are explaining the relationship between the two selectors! This is called the `Descendent Selector`

* `Other combinators are: > + ~`
* `>` `Child Combinator`, used by child selectors. 

`Child Selectors only select DIRECT children. e.g. div .main > a (would only select those links which are direct children. Any links nested within <p> tags for instance would be untouched).`
* Remember there is a huge difference between CHILD and DESCENDENT selectors! You're either selecting direct elements or all of them! 

* `+ Adjacent Sibling Combinator` - used by adjacent sibling selectors which target an element's next sibling on the page - i.e. the one in the mark-up that immediately follows the elements. e.g. if you had in your markup `<h2><p>` - then in the CSS, `h2 + p { }` would target only the `<p>` tags that followed the `<h2>` tags. Remember they must be a siblings - so at the same level. Otherwise it'd be a child! 

* `~ General Sibling Combinator` - again used to target siblings, but not only immediate siblings - it targets every specified sibling that follows an element. e.g. 
`<h1></h1><p></p><a></a><p></p>`   
Then in your CSS `h1 ~ p{color: blue}`  
This would style all paragraph siblings, even those not adjacent to the `<h1>` (so it wouldn't matter in our example that there was an `<a>` tag in the way, the second `<p>` would still get styled).
