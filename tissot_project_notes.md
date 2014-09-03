#Tissot project notes

##Keep code simple, especially in the view

If troubleshooting, don't keep adding code on top! Problems were solved by stripping code down and starting again. So rather than trying to fix by adding on more and more code, try turning off properties and clases, before writing more CSS. Remember, each line of code or CSS you take out, is taking out a potential bug. 

My slider in the Tissot site was a classic example. Whilst my gallery partial was simple and good work, the slider was way too complicated, especially considering it was all going on in the view. 

When I'm approaching a piece of code like the slider:
* I should break the solution into chunks. 
* Don't try and solve the whole problem at once!
* Close down all other tabs in sublime and focus. 
* Do quick iterations in "inspect element" to test things.
* Prove each step of code works and then move on - this helps massively with bug fixing, as it'll likely be your last piece of code that's the issue, if you've been testing as you went. 

## Don't write the whole thing with helper classes - there is a balance between using helper classes and adding styles to individual elements in the CSS.

I made the mistake of trying to make my code super minimal and just rely on stacking up helper classes in the html. But I'd created lots of helper classes with just one line of code, which is not the thing to do. And I'd also created lots of unsemantically named classes, such as no-padding-bottom, or overflow-hidden. So, rather than have: 
<div class="slider-item no-padding-bottom overflow-hidden">Blah</div>
I should have: 
<div class="slider-item">
And then have: 
.slider-item{
	padding-bottom: 0;
	overflow: hidden;
	// Then whatever other styles for slider-item
}
This makes my html much less bloated, and stops me creating endless amounts of unsemantic helper classes. If in doubt, air on the side of less helper classes. And remember that you can always use those classes within, using @extend. 

Also, when I'm naming helper classes, keep the names short. So rather than `section--no-padding-bottom`, go for something like `section-tight`. Makes your code easier to read and maintain. 


##If I'm using a grid, open codepen and test how my grid will work - write the CSS/SASS and then use my own code

If I've built it, I'll know exactly how it works, and what grid items are available to me. 

Also, I don't always need to use a modular grid component - if it's a simple layout with just two halfs, rather than mess about with grids, it's fine to do two simple inline-blocks, or two 50% divs floated. Keep it simple. 

##Build up to using BEM
I don't have to make my projects identical to Rich's - it's much better to build up slowly to that level, but to make things simple and well structured. I can move onto BEM at a later stage if need be. Also BEM modifiers only work within SASS on the more recent SASS versions (if I'm using an older version of SASS, I can use BEM, but not in the form of &--modifier). 

##Using SVG's

I'd opened each SVG in sublime text, then cut and pasted the SVG code into my project (no file was required in that case, as SVG's are simply coded dots). However, this led to super bloated code in the view. So, if I take this approach, one option is to create PHP partials for each SVG - this will clean up my code in the view. 

If you have loads of SVGs, rather than take the above approach, you can create an SVG sprite (as we did on the Superdrug project where we used Gulp taskrunner). 

Another alternative, is to use SVGs as I do images, and drag the actual files into my project, into the Web folder like I do images. Then in the code I just link to that SVG, so `<img src="blah.svg">`. This is a perfectly legit way to do it, and each individual request won't take that long anyway. 

On the speed front, I'd been worrying about metrics that I'd not even measured yet (such as the time it takes to request and respond with an SVG). The best thing, is to do a project quick and simply. Then, if you have time at the end of the project, speed the site up - you can look at metrics then and maybe consider: 
* image compression
* sprites
* CSS minimisation (I should do this anyway though!)
* and so on… Check out Ignasias' slides too.
* Remember, iframe's slow down page load times anyway.  

##Don't have too much logic in the view - put it in the actions or components instead. 

For exampler, in my slider.php, I had a huge clusterfuck of logic and html. It would have been much easier to loop through the articles and set them to have a half-height or full-height in the actions, and then in the view just a simple if else php loop and simple mark up. 

##Don't bloat the actions unnecessarily

If you are just passing a huge number of variables through various views, rather than setting them in the actions, set them later in a component. It's not cut and dry as to when you should use a component, but if you find yourself passing a huge array of variables from the actions straight through from one view to another, it's fine to create a component for the eventual view, where your variables are created. 

##Don't echo divs and html
So rather than: 
`<?php if(x>y){ echo '<div>' . $variable . '</div>'; }
Do: 
`<?php if(x>y){ ?>  
<div><?php echo $variable ?></div>
<?php } ?>

It makes your code much easier to read, as html won't be lost amongst the PHP code. 

##If using if() conditionals along with a counter, use a for loop instead! 
I'd used an if() and a counter, which is ridiculous given that this is what for loops do! 

##If working in Campaign, create a branch off Master, which becomes my new Master for this project. 

* So in terminal, clone master into my personal dev, and call my version Tissot (effectively my version of Master). 
* Then do an early push - now other people can clone and work on my branch. 
* Now for each little piece of work I do, I can create a branch off of Tissot (my Master). This means that I can get people to review my work as I go, rather than in one huge commit just before release! 
* Other people might also create branches off of Tissot (my Master) to do little pieces of work on my project. I can do 'git pull origin tissot' to pull in the latest changes from Tissot (my Master). 
* Then when I'm happy that my Tissot branch (my Master) is completed, I can then merge that into the original Master in GitHub. 

##Use the console - learn how to use it, urgently! 
It will help hugely with troubleshooting and is an essential skill to have. Rich is sending an inspect element screencast to me. 

##Only break up Javascript or Jquery into little functions if required
In my Tissot project I just had a handful of little jquery commands. So no functions were really required, to split the code up. But in the upcoming Beko project for example, it'd be wise to modularise the JavaScript (e.g. utilise functions in my appliation.js file), as there is more of it. 

Also, in various templates in Symfony, we've included a phrase along the lines of include()customJavascripts - try commenting this out and see if anything happens, as if it's not required, take it out! (it's probably a remanent of an old project where I'd copied the template code).

##Whether or not to include your CSS file (e.g. web/tissot/style.css) when commiting in terminal
It depends on the project. You **will** need to include your CSS file when you do the commit, **unless** you've specifically set up the project to generate a compressed CSS from the SASS **on build**. You should check the build.xml file to see what's been set up. I have notes on creating a compressed CSS file at the build stage, from my earlier stand-alone (not Campaign) site. We don't use this approach for Campaign, as we don't want to regenerate CSS for all the various sites each time we build. 

It's important to remember though, that **you don't need anything set up on a project to compress the CSS using SASS, BEFORE the build stage** - in fact, it is vital to do this before you release, to minimise your CSS. So if you're not taking the approach in the paragraph above (compressed CSS file created at build stage), you can just replace the SASS --watch property with the --compress property, and then after running that SASS command, do a commit - 'Commit compressed CSS'. Of course, if you never actually look at the CSS file generated by your SASS, you can just do the compression from the start of your project (rather than just before you release) - you do this by including both the --compress and --watch properties in your SASS command in terminal. 

##When it comes to compressing my Javascript
I think Rich might have done this using Gulp on a recent stand-alone project, but when I'm working on Campaign, it's fine just to use an online js compression tool for my javascript before I release. Test to make sure your Javascript still works though!

##Controlling the size of images

First off, I should never be cutting images up in Photoshop. It's my job to go to Erlen and say "I've looked at the design, and I need the images at these ratios or dimensions." "You want them retina?". "Yes please!"

In terms of controlling the size of images, having requested images at certain sizes, I should then use my tags (e.g. <div> tags) to control the size of images. I will have set `max-width: 100%;` on all my images (height: auto; is not required, as auto is the default), meaning that images won't stretch to be bigger than they are. 

If I want to use the same image in different parts of my website, and at different sizes (e.g. 400x400 in article, then 250x250 in teaser div), then you can request a smaller image from MediaBank (great for speeding page load times up and image download times down) 
* I can use the code from the ImageHelper section in Symfony, whereby you set an array after your image request, stating the width you want the image (you don't need to state the height, as MediaBank will keep the original ratios). 
* MediaBank then checks to see if it has a cached version of the image at that size. If so, it supplies that image very quickly. 
* If MediaBank doesn't have a cached version of your image requested at that width, it quickly creates one and sends it to you (as well as caching a version for future use). It's very cool, as the image it sends you will also be less kilobytes - so it's well worth using this width array when requesting smaller versions of images, rather than just serving a massive image and forcing it to go small with your `<div>` tags. Of course, the other advantage of taking this width array approach, is that you don't need to upload lots of different versions of the same image - just upload one image and then let mediabank do the rest. 



##Keep the speed up! 
If you hit a roadblock and can't fix something, you can: 
* Go with a super simple solution and move on - you can always come back to it later on. 
* Seek advice, or even chat to Paula and Erlen to say this is really hard to code - there is nothing wrong with pushing back, as the PSD design can be altered or a comprimise agreed (even after approval)if need be. 
* Don't let tiny things delay the project. Keep an eye on the time. 

You want the project ready to release as soon as possible, even if it's only 90% there. You can touch it up later. 

##Don't get sidetracked by PM/colleague requests in the meantime
Every interuption slows you down by much more than 15 minutes, as you lose flow and get sucked into tasks that are not as critical as you getting your site out. 

If things are taking longer than you hoped on the project, flag it up as early as possible. There is nothing wrong with saying 'this is taking longer than expected, it's quite a big bit of work and I need more time' - but you need to flag it early, to help yourself and your boss. 

##Use the team
I've added whole sites of content for Rich and Chris, and colleagues are there to help each other. Get others to help you, so that you can focus on the code.

##Helper classes
Rich is going to provide some examples of using helpers effectively. Remember to ask him about these before he leaves. 

Functions in the lib/helpers folder, are available to the view - e.g. if you say to `includeImageHelper` in the view, this functionality is available to use in the view.

If you find yourself repearing the same IDA calls and functions, or say if you wanted to share IDA calls and logic across the action and components in your project, you could create your own class (containing IDA call functions) in the lib folder - you would then call that class in the actions and components files (e.g. getClass…). This can be very powerful as it simplifies code.



