#SVG icons - Scalable Vector Graphics

A great article on what SVGs actually are: <http://blog.digitaltutors.com/svgs/>

'SVGs are amazing on the web. There are so many things that are possible through them that JPEGs and PNGs can’t even come close to, like animation and scalability. SVGs are more versatile because you’re telling the browser to create the graphic as opposed to just displaying it. Since the browser is creating it, you’ll be able to manipulate it in ways that aren’t possible with other image formats.'

'When you create an SVG, you’re really creating some code that will tell your browser how to draw your graphic. If you’re creating a graphic in a program like Illustrator, when you save it, it actually creates the code that the browser will use based upon what you made.'

##Creating and using SVGs

<http://css-tricks.com/using-svg/>

So SVG's are created in Adobe Illustrator. When the designers are saving the SVG, they can either save it as a file, or they can click on 'SVG code and' it will open TextEdit with the SVG code in there.

###If we saved the SVG as a file… 

you can use it in your project directly in an `<img>` tag:

	<img src="kiwi.svg" alt="Kiwi standing on oval"> 

If you don't specify a width and height, the image will be exactly the size you created it (in pixels) in Illustrator. You can change the size of it though just by selecting the img and changing it's width or height in the CSS. 

	<img class="papa" src="http://s.cdpn.io/3/kiwi.svg">
	
	// Then in the CSS
	.papa {
		width: 250px;
	} 

Doing it this way works everywhere except IE8 down and Android 2.3 and down. 

A fallback for those browsers is to test for SVG support with Modernizr and swap out the src of the image for a PNG if required: 

	if (!Modernizr.svg) {
		$(".logo img").attr("src", "images/logo.png");
	}
	
David Bushell has a simple alternative using JavaScript (but it involves JavaScript in the markup):

	<img src="image.svg" onerror="this.onerror=null; this.src='image.png'">
	
	
#####Example of saving SVGs as files and using them in a project

For an earlier project we worked on: 

* The designer created the SVGs, and saved them in an SVG folder on the shared drive.
* I copied the ones I wanted, and dropped them into the web/images/svg folder in my project (in finder still). 
* We then ran: 
`gulp sprites`.
This gulp task updated the svg sprite in the project, and also updated the _icons.scss file with the new icons. 
* Then in my view: 
	
		<?php include_partial('icon', array('icon' => 'icn_link-youtube')) ?>`
	
* Then if you want to change the color of the icons, within your scss module (e.g. _footer.scss), you just style them: 
	
	
		.footer{
			.icon{
				fill: $brand-colour;
			}	
		}
	
	
####Using SVG as a background image
Similarly easy to using SVG in an `<img>` src, you can use it in CSS as a background-image. 

	.logo {
		display: block;
		text-indent: -9999px;
		width: 100px;
		height: 82px;
		background: url(kiwi.svg);
		background-size: 100px 82px;
	}

You need to set the background-size to the size of the logo element. Otherwise we'll see a bit of the upper left of our much larger original SVG image. These numbers are aspect-ratio aware of the original size. But you could use a background-size keywords like contain if you want to make sure the image will fit and can't know the parent image will be of the exact right size.

Same support for SVGs as background images - IE8 down and Android 2.3 down are the problems. 

Modernizr can help us here, and in a more efficient way than using img. If we replace the background-image with a supported format, only one HTTP request will be made instead of two. Modernizr adds a class name of "no-svg" to the html element if it doesn't support SVG, so we use that:

	.main-header {
		background: url(logo.svg) no-repeat top left;
		background-size: contain;
	}
	
	.no-svg .main-header {
		background-image: url(logo.png);
	}

Another clever progressive enhancement flavored technique for using SVG as background-image is by using it in conjunction with multiple backgrounds. SVG and multiple backgrounds have very similar browser support, so if the browser supports multiple backgrounds, it supports SVG, and the declaration will work (and override any previous declaration).

	body {
		background: url(fallback.png);
		background-image: url(image.svg), none;
	}

##The problem with using SVGs in img src and background-image…
Is that you don't get to control the innards of the SVG with CSS (e.g. for changing the colour of the SVG)…

So, it's better to take an inline approach to SVGs (as we do in more recent projects):

##An inline approach to SVG
The first option is to grab the code right from Illustrator whilst saving the SVG - or alternatively, to open the SVG file in a text editor and grab that code. Then you just drop that code right into a HTML document and the SVG image shows up just the same as if you had put it in an img tag. 

	<body>
	<!-- paste in SVG code, image shows up -->
	</body>

This can be nice as the image comes over right in the document and doesn't need to make an additional HTTP request (so it has the same advantages as using a Data URI). 

######I used this approach on an older project and made the following notes: 

With this approach, you are effectively telling the browser to create the graphic as opposed to having to go and fetch a file. 

So I just opened the svg file in sublime text, and grabbed this code for that particular SVG. I then inserted that into my html/php file where required. I didn't need to put that SVG file into the Web folder: 

	<svg version="1.1" id="Icons" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
     width="15px" height="9px" viewBox="0 0 15 9" enable-background="new 0 0 15 9" xml:space="preserve">
	<polygon points="7.5,9 0,1.396 1.376,0 7.5,6.209 13.624,0 15,1.396 "/>
	</svg>

However, this approach has disadvantages too - a bloated document, a big chunk of stuff right in the document you're trying to author, also an **inability to cache**. 

To clean up the authoring experience, if you're using a backend language like PHP that can go and fetch the SVG file and insert it, you could clean up the authoring experience: 

	<?php include('kiwi.svg'); ?>

Another drawback is that the SVG that Adobe Illustrator gives you isn't optimised - it has a DOCTYPE and generator notes and so on. You can use a SVG optimiser tool if you want - <http://petercollingridge.appspot.com/svg_optimiser>

####A big plus for inline SVGs, is that you can control them with CSS

The SVG looks a lot like HTML - that's because they are both essentially XML (named tags with angle brackets and stuff inside). So you can give svg elements class names and then target them with your CSS. 

	<svg ...>
		<ellipse class="ground" .../>
		<path class="kiwi" .../>
	</svg>

SVG elements have a special set of CSS properties that work on them (but you can use normal stuff like :hover)

	.kiwi {
		fill: #94d31b; 
	}
	.kiwi:hover {
		fill: #ace63c; 
	}

SVG also has fancy filters, for instance blurring. So you'd chuck a filter into your SVG, and then apply that in your CSS as needed. 

	<svg ...>
	...
		<filter id="pictureFilter" >
    	<feGaussianBlur stdDeviation="5" />
    	</filter> 
    </svg>
    
    // Then in the CSS
    .ground:hover{
    	filter: url(#pictureFilter);
	}
	
See full example here: 
<http://css-tricks.com/using-svg/>

This inline approach also has the IE8 and below and 2.3 Android and below issue. Similarly, you can just use Modernizr to set a fallback. 

	<!-- In the HTML -->
	<svg> ... </svg>
	<div class="fallback"></div>
	// In the CSS
	.fallback { 
		display: none;
		/* Make sure it's the same size as the SVG takes up */
	}
	.no-svg .fallback { 
	background-image:
	url(logo.png); 
	}

###Alternative to inline - using SVG as an object

If drawbacks (like being hard to cache) put you off inline, you can link to an SVG file and retain the ability to affect its parts with CSS by using <object>

	<object type="image/svg+xml" data="kiwi.svg" class="logo">
		Kiwi Logo <!-- fallback image in CSS -->
	</object>

For the fallback, Modernizr detection works fine here: 

	.no-svg .logo {
		width: 200px;
		height: 164px;
		background-image: url(kiwi.png);
	}

This approach is better for caching and has deeper support than using it any other way - however, drawback to using SVG as an object is that you can't use an external stylesheet or `<style>` on the document - you need to use a `<style>` element **inside the SVG file itself**. 


	<svg ...>
		<style>
    /* SVG specific fancy CSS styling here */
    </style>
    ...
    </svg>


###Data URI's for SVG
Another way to use SVG's is to convert them into Data URI's.  Data URI's might not save you actual file size, but can be more efficient because the data is right there. It doesn't require an additional HTTPrequest. 

<http://www.mobilefish.com/services/base64/base64.php> - has an Output base64 encoder and decoder. Paste in the contents of your SVG file and copy and paste the  resulting data after conversion (remember to remove the line breaks in the stuff it spits out).

You can use the Data URI's anywhere that we've covered so far, apart from inline SVG. 

See <http://css-tricks.com/using-svg/> for where to insert the Data URI's.

##The inline method that we used on Aveda Global

This article - <http://tympanus.net/codrops/2013/11/27/svg-icons-ftw/> - gives a good account as to why we use SVGs:

Using raster graphics for icons isn't manageable in CSS. If you need to change a colour of an icon for a hover/active/focus state, you'd need to add another raster graphic/icon image for each. And if you needed to add another size,  you'd likely need to add yet another image - leads to bloated sprites and style sheets that are hard to maintain and scale. 

`Icon fonts` (e.g. <http://weloveiconfonts.com/>) rescued us. They were: 

* plain text, so could be gzipped by up to 95%
* a vector graphic, so could be scaled to any size, making it Retina ready
* it was one source file, minimising HTTP requests
* It's a font - so you can easily change colour, size, shape and add a shadow
* browser support for older browsers possible (e.g. IE6)

However, limitations of icon fonts include: 

* They are monochrome & we can only use styles for texts (e.g. like a text shadow) - we can't, for example, use an inset text shadow or apply different colours to the details. 


`SVG icons` extend the benefits of icon fonts. Additional super powers are: 

* consistently crisp rendering across browsers and operating systems
* the power of CSS - the ability to style our icons with CSS
* the power of SVG filter effects
* the power of interactivity - we can use animations with CSS or JavaScript
* the power of the Markup language


So in the Aveda Global project, we created an _svg.php partial, where we declared the SVGs, giving each one an ID for future reference. As our shapes consisted of many small chunks, we wrapped them all with a g tag. 

	<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="display: none;">
		<defs>
			<g id="icon-watch">
				<path fill-rule="evenodd" clip-rule="evenodd" d="M8.5,0C3.8,0,0,3.8,0,8.5S3.8,17,8.5,17S17,13.2,17,8.5S13.2,0,8.5,0z M6.5,12V5
	l5.9,3.5L6.5,12z"/>
			</g>
			<g id="icon-read">
				<path d="M126.7,375c-7.3,7.3-7.3,20,0,29.1c7.3,7.3,20,7.3,27.3,0l227.3-230.9c7.3-7.3,7.3-20,0-29.1L154-85c-7.3-7.3-20-7.3-27.3,0
	c-7.3,7.3-7.3,20,0,29.1L334,158.6L126.7,375L126.7,375z"/>
			</g>
		</defs>
	</svg> 


We were then able to use these two graphics wherever we wanted in our HTML document with the help of `use`. The `xlink:href attribute` is a reference to our shape by its ID. 

So in our articles partial for instance, we used the graphic: 

	<a href="http://www.test.com">Read more 
		<svg viewBox="121.3 -90.5 265.5 500"><use xlink:href="#icon-read"></use>
		</svg>
	</a>

The `use` element is taking nodes from within the SVG document, and duplicating them elsewhere. 

We can simply use CSS to style our icons. The most common and useful properties are: 

* width and height
* icon colour - using the fill property
* stroke - by setting stroke or stroke-width

#####Adding filter effects (supported from IE10 upwards)
Filter effects are the real super power of SVG. There are lots of ready to use, pre-made filters we can use. 

To use a filter effect with our icon, we need to declare it (via a `<filter>` tag) in our SVG source document, with a unique ID for referencing, just like we did with the icon. 

	<filter id='inset-shadow'>
	<!-- Shadow offset -->
	<feOffset
	dx='0'
	dy='0'
	/>
	<!-- Shadow blur -->
	<feGaussianBlur
	stdDeviation='1'
	result='offset-blur'
	/>
	<!-- Invert drop shadow to make an inset shadow -->
	<feComposite
	operator='out'
	in='SourceGraphic'
	in2='offset-blur'
	result='inverse'
	/>
	<!-- Cut color inside shadow -->
	<feFlood
	flood-color='black'
	flood-opacity='.95'
	result='color'
	/>
	<feComposite
	operator='in'
	in='color'
	in2='inverse'
	result='shadow'
	/>
	<!-- Placing shadow over element -->
	<feComposite
	operator='over'
	in='shadow'
	in2='SourceGraphic'
	/>

If I wanted to then use this filter effect, I would add the filter reference to a new group wrapper: 

	<svg viewBox="0 0 32 32">
		<g filter="url(#inset-shadow)">
    	<use xlink:href="#heart-icon"></use>
    	</g>
	</svg>

####Adding interactivity to SVGs
So we can use CSS or JavaScript to animate icons. 

Example used on <http://tympanus.net/codrops/2013/11/27/svg-icons-ftw/> was an animated clock - starting with an alarm clock icon as the 'SVG source document', it consisted of different shapes wrapped in a group with the ID #clock-icon. You then added a transform value to these shapes, and controlled that transform in the javascript (creating a new rotate value every full second). Creates a cool ticking clock effect.  

####Summary 

Using SVG as icons in our projects:
 
* Means only one HTTP request
* Scalable vector and so intrinsically Retina ready
* Easy styling of colour/size/effects in CSS
* SVG icons are lightweight
* They are text, so can be gzipped up to 95%
* Power of SVG filter effects
* XML like structure
* We can have multicoloured icons
* We can make use of isolated styles and media queries
* We can make use of isolated animations with CSS or JS
* Supported by all major modern browsers

####Icon Melon
<http://iconmelon.com/>  
A free & open source boilerplate for the icons itself, the filters and the CSS. You can create icon sets, download all the required files, submit your own graphics and have access to the free SVG icon sets. 

###Conditional comments around SVGs

Finally, if icons aren't mission critical, and so you're not concerned by them not appearing in IE8, you can add an SVG guard, or a conditional comment around each SVG. That way the SVGS will display in modern browsers, but won't break the site in IE8. We did this on the NME Austin site when the client asked at the last minute for support in IE8. 

	<!--[if gte IE 9]><!-->
		<svg class="category-icon" width="38px" height="38px" viewBox="21 21 38 38">
			<use xlink:href="#icn-' . $article->getTargetTerms() . '"></use>
		</svg>
	<!--<![endif]-->



##jQuery ccan't add a class to an SVG.

http://stackoverflow.com/questions/8638621/jquery-svg-why-cant-i-addclass

