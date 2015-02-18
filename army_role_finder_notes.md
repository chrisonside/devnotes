#Notes from Eduardo on Army role finder

	// If true, start function. If false, listen for INIT.
	window.onload = function() {
  	if (Enabler.isInitialized()) {
      roleFinder.init();
  	} else {
      Enabler.addEventListener(studio.events.StudioEvent.INIT, roleFinder.init);
  		}
	}

This means that once the window has loaded, if the DoubleClick enabler is inititalised, call the init property (which happens to be a function) within our roleFinder variable. 

N.b. window.onload means once the window has loaded (so the entire page including content - so images, css, scripts) - window.onload has taken over role of document.onload in some browsers and fires when the DOM is ready too.  

We have one global variable called roleFinder, and within this there are various properties. It's not good to have lots of global variables - they are frowned upon, as what if another dev does the same and for their code sets a global variable which overrides yours - someone's code is going to stop working. So keep global variables to an absolute minimum. 

So the one global variable Eduardo set was the `roleFinder variable`, and this has all sorts of properties. As above, the property we'd called on window load, was the roleFinder (global variable)'s init property (which happended to be a function) - properties can be anything from strings, to integers, to functions, to arrays. e.g. here are some of roleFinder's properties: 

	var roleFinder = {
		roleFinderName: 'army',
		$roleFinderContainer: $("#roleFinderQuestion"),
		randomiseQuestions: true,

		maxQuestions: 5,
		totalQuestions: 0,
		currentQuestion: -1,
		removalThreshold: -3,
		answerDelay: 800,
		scores: [],

		brands: {look: 'LOOK', now: 'Now', marieclaire: 'Marie Claire'}, 

Within the roleFinder, we also do things like set up the five role properties (e.g. Adventurer), giving each a title, image and DoubleClick exit points for each brand. We also do things like setting up the quiz questions. 

These properties are all stated in JSON syntax. We don't need to do a JSON parse on this, as we are writing the JSON directly into our JavaScript file. 

JSON is syntax to define objects and their properties, and to then pass this data between different languages. So for instance you might have PHP grabbing data from a database - the PHP might grab the data but display it in JSON format. Then the JavaScript code can easily grab that JSON object and do something with that data. JSON syntax is written the same, whether in a PHP or JavaScript (or any other language) file. 

Sometimes, you might need to do a JSON parse - so for another project, Eduardo had in PHP created a timestamp that wasn't affected by a user's timezone or what time the user might have set their clock:

	timeincAd.processServerTime({"time":1417793529,"events":[{"handle":"samsung","endDate":1417179600,"label":"12PM"},{"handle":"sony","endDate":1417183200,"label":"1PM"},{"handle":"lg","endDate":1417186800,"label":"2PM"}]});

Then in the Javascript file he'd parsed the JSON (this step was required as he hadn't written the JSON straight into his Javascript file).  

So back to our app, the init property (which happens to be a function) within roleFinder was: 

	init: function () {
		$("#placeholder").fadeOut();
		Enabler.counter('Counter - Init', false);
		roleFinder.readQuestions();
		roleFinder.bindUiEvents();
		roleFinder.initQuestion(0);
		roleFinder.updateResults();
		requestBrandSite();
	}	
	
And this is our starting point. So it says fade out the placeholder div first, then set the DoubleClick enabler counter (not sure how the doubleclick counter works - need to ask John). Then within the roleFinder object (or global variable), find the readQuestions property (which happens to be a function). So in the code, the readQuestions property syntax is: 
	
	readQuestions: function () {
		I'd insert the code here… 
	}

We then loop through the questions (which have been set up above within the roleFinder global variable) - e.g.:
	
	questions: [
		// Question #0
		{
			question: 'When it comes to travel, you have more stamps in your passport than pairs of killer heels in your wardrobe.',
			image: 'question1.jpg',
			weights: [
				{
					roleIndex: 3,
					weight: 1
				},
				{
					roleIndex: 2,
					weight: 0.1
				}
			]
		},
		
		// Question #1
		{
			question: 'You love shopping for new season updates, but always have a tight grip on your finances.',
			image: 'question2.jpg',
			weights: [
				{
					roleIndex: 0,
					weight: 1
				},
				{
					roleIndex: 2,
					weight: 0.25
				}
			]
		},
		
And for each question, we set the main role for that question and any associated weights. The next code then just checks that there isn't another more heavily weighted role for that question (e.g. if we've manually given another role more weighting). 

So we've got a long array of questions (each with a main role in mind) - we then randomise the order. 

	// Shuffling questions
		if (this.randomiseQuestions) {
			this.questions = this.shuffleArray(this.questions);	
		}
		
That function is now done, so we refer back to our init function. This says we should now call the bindUiEvents property, which is all about binding the user interface to our code. 

Eduardo usually keeps the UI binding in a totally separate function, as it's not logic associated with our code, but rather a manual binding between elements on the page and our app. 

	bindUiEvents: function () {
		var _this = this;

		$("#buttonPrevious").click(function () {
			_this.processMove('previous');
			$("#buttonNext").removeClass("hidden").removeAttr("disabled");
		});
		$("#buttonNext").click(function () {
			_this.processMove('next');
		});

		$("body").on("click", ".answer", function () {
			_this.updateNavigation();
			clearTimeout(_this.answerTimeout);

			if ((_this.currentQuestion + 1) == Math.min(_this.totalQuestions, _this.maxQuestions)) {
				_this.processMove('next');
			} else {
				if (_this.answerDelay >= 0) {
					_this.answerTimeout = setTimeout(function () {
						_this.processMove('next');
					}, _this.answerDelay);	
				}
			}
		});
	},
	
Note that we start off by saying `var _this = this;` - this is a common thing do when you have another function within your function, and you want the second function to be able to use the 'this' keyword, but in relation to the first function's 'this', rather than what 'this' would mean to the second function. So _this basically creates a cached version of 'this'. So in our example, 'this' refers to the global variable roleFinder - so by stating `var _this = this;`, we are setting _this to refer to roleFinder, and even if we have another function within, we can use _this, and be sure we are referring to roleFinder, rather than that second function within's 'this'. 

Once the UIfinder function is done, next up in the init:function is the initQuestion property (which happens to be a function) - we also pass through a index value (of 0) to that function. We loop through the questions, and for each question, we establish if there is a main role for that question - if that role has already been ruled out for the user (they've hit the removalThreshold: -3 for that role), we use the javascript splice method to scrap that question, and then we jump back to the start of the initQuestion property and have another go. 

If the question hasn't been ruled out for the user: 
	
		else {
				this.$roleFinderContainer.fadeOut(function () {
					_this.$roleFinderContainer.html(_this.writeQuestion(index));
					_this.currentQuestion = index;
					_this.updateResults();
					_this.updateNavigation();
				}).fadeIn();

				this.sendQuestionCounter(index);
			}
			
then we write the question. The current question becomes the index, and then we update the results and update the navigation (simple UI stuff, like updating the 1/5 question pagination and the visibility of the before and next buttons). We also send counter info off to the Doubleclick enabler. 

Once we've looped through the questions, we call the end() function. 

	end: function() {
		var role = this.getRole();

		if (!this.brandSlug) {
			//console.log("*** Didn't find a brand, will choose a random one...");
			this.brandSlug = getRandomBrand();
			this.brandName = this.brands[this.brandSlug];
		}

		// Calling the right exit
		role.exits[this.brandSlug]();

		this.updateResults();

		// Restarting the quiz
		setTimeout(this.restart, 2000);
	},
	
So the getRole() function which sets & returns the relevant role (saying which number of the roles array this role is). Back to the end function, and we set the brand slug and call the correct exit. We also call the updateResults function, before setting a timeout to restart the quiz.  

In the restart function, there was this code: 

`$roleFinderWrapper.html(this.structure);` - it's good practice that if create a jquery object (in this case `var $roleFinderWrapper = $("#roleFinderWrapper");`), then when you reference that variable later in your code, you include a dollar sign before it, to show that it's a jquery object. 

###Also.. 
There were also a few cuntions set up by John at the top of the page, where he'd set up a 'message' event listener on the window, in order to then pass very basic information from the website to the double MPU (an iframe). 

There are strict restrictions on what data can be passed between a website and an iframe, for security reasons. Otherwise you might pass or strip damaging data between the two. But you can pass very basic data - in this case brand title, which can then be used in the MPU (iframe) to display a tailored message with that brand name in there. 

	window.addEventListener('message', function (message) {
	if (message.data == 'ipcBrandSite') {
	    var brandName;
	    var brandSlug = getBrandNameFromURL(message.origin);

	    for (var property in roleFinder.brands) {
			if (roleFinder.brands.hasOwnProperty(property)) {
				if (property == brandSlug) {
					brandSlug = property;
					brandName = roleFinder.brands[property];
				}
			}	    	
	    }

	    // If we don't have a brand name at this points, it means we're outside of our brand sites. We'll choose a random brand in that case.
	    if (!brandName) {
	    	brandSlug = getRandomBrand();
	    	brandName = roleFinder.brands[brandSlug];
	    }
	    
	    if (brandName) {
	    	$("#roleFinderWrapper").find("header p").text("Take " + brandName + "'s quiz to discover your perfect career");    	
	    }

	    roleFinder.brandName = brandName;
	    roleFinder.brandSlug = brandSlug;
	}
	});


###Things to read up on

* JavaScript Module Patterns
* 'this' scope in JavaScript
* JSON. 


