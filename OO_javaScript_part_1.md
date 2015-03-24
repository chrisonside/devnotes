
#Object Oriented JavaScript
JavaScript is not a classic OO language - it's a PROTOTYPAL one. 

#####Illustrating OOP concepts
* Bob is a man - an object 
* Bob's date of birth is 1 Nov 1979 - property
* Bob can eat, sleep and drink - methods
* Bob is an instance of class Web Developer - class (in classical OO - not JavaScript though, as there are no classes and everything is based on objects - JavaScript is based on the notion of prototypes, which are also objects. In PHP you'd say create me a new object which is an instance of class Web Developer. In a prototypal OO language like JavaScript, you'd say 'I'm going to take this object person which is lying around and reuse it as a prototype for a new object that I'll call Bob').
* Bob is based on another object, called Web Developer - prototype
Bob holds data (such as birth date) and methods that work with the data (such as calculate age) - demonstrates encapsulation.
* We don't need to know how the calculation method works internally (it might have some private data) - information hiding
* Bob is part of a Web Dev Team object, along with Jill, a Designer Object, and Jack, a Project Manager object - aggregation, composition. 

##Primitive data types

* Numbers
* Strings
* Boolean (only possible values are true or false)
* Undefined (console says this if you try and access a variable that doesn't exist. Or if you declare a variable but haven't given it a value yet - when you declare a variable without initialising it, JavaScript automatically initialises it to the value undefined). Only value of the undefined data type is the value undefined. 
* Null (special data type -  so it is defined, but it can only have one value, the null value)

##Non-primitive data types (i.e. OBJECTS!)
Anything that doesn't belong to the list of primitive data types above is an object. 
Note though that **even null is considered an object**. 

###When converted to a boolean…
All values become true when covered to a boolean, except the six falsy values: "", null, undefined, 0, Nan, false. 

###typeof Operator
`typeof n;`
Tells you the data type of a variable or a value. Will spit back: number, string, boolean, undefined, object or function. 

###NaN
Nan is a special value that is also a number. You get NaN when you try to perform an operation that assumes numbers but the operation fails. e.g. `10 * f;`

N.b. NaN is not equal to anything, not even itself. NaN == Nan will return false. 

###Operator precedence

`Operator Precedence` - assuming no parentheses that assume otherwise, * has precedence over + - so `1 + 2 * 3` is `7` not 9. Similarly in logical operators, the order is ! then && then ||.

`Best practice - use parentheses` rather than relying on operator precedence. Makes your code easier to understand! 

###Lazy Evaluation
If result becomes clear at some point before end of logical operations, the JavaScript engine becomes lazy/efficient and skips to end result. 
 
##Arrays
A more interesting **data structure** than the basic primitive data types. Arrays are of course objects. 
	
	var a = [];
	typeof a;
	// result is object
	
* An array is simply a list of values. 
* Instead of using one variable to store one value, you can **use one array variable to store any number of values as elements of the array**.

Note you can add more elements, by addressing an index that didn't exist before. 
	
	var a = [];
	var a = [1, 2, 3];
	a[3] = 4;
	
If you add a new element, but leave a gap in the array, the elements in between ()that have been missed out) are all assigned the undefined value. 

You can use the **delete operator** to delete an array element. It won't actually remove the element, but rather set its value to undefined. So after the deletion, the length of the array does not change. 

##Arrays of arrays

An array can contain any type of values - including another array. 

	var a = [1, 2, "three", false, null, [1, 2, 3]];

To access an element in the nested array: 

	a[4][2]
	//result would be 3
	
Note that you can also use the array notation to access individual characters inside a string: 

	var s = 'one';
	s[1];
	//result would be n

So to recap on arrays: 

* An array is a data store
* An array contains indexed elements
* Indexes start from zero and increment by one for each element in the array
* To access these elements, use the index inside square brackets
* An array can contain any type of data, including other arrays


##Conditions and Loops
`Conditions` provide a simple and powerful way to control the execution through a piece of code

`Loops` allow you to perform repeating operations with less code

A `code block` consists of zero or more expressions enclosed in curly brackets:

	{
		var a = 1;
		var b = 3;
	}
	
You can nest blocks within each other indefinitely. 

###if Conditions
 
	var result = '';
	if(a > 2){
		result = 'a is greater than two';
	}

3 parts to an IF condition: 

* The if statement
* The condition - **which always returns a boolean value**
* The code block to be executed if the condition is satisfied

`There is an optional ELSE part of the if condition`, which executes an alternative code block if the condition was evaluated to be false. 

	var result = '';
	if(a > 2){
		result = 'a is greater than two';
	} else{
		result = 'a is not greater than two';
	}

In between the if and the else, `there can also be an unlimited number of ELSE IF conditions`: 

	var result = '';
	if(a > 2){
		result = 'a is greater than two';
	} elseif{
		
	} elseif{
	
	}else{
		result = 'a is not greater than two';
	}

##JavaScript functions - Functions are data!

JavaScript functions are DATA - so the following two ways of defining a function are the same:  
**function f(){return 1;}**  
**var f = function(){return 1;}**

I'm more used to seeing the first way of defining a function - the second way - var f = function(){return blah} - is know as *function literal notation*.

JavaScript functions are a **special kind of data** with 2 important features:     

* They contain code  
* They are executable (they can be invoked)

A function always returns a value - if it doesn't return a value explicitly with `return`, then it does so implicitly by returning undefined.  A function can only return one value.


####Annoymous Functions

In JavaScript, it's fine to have pieces of anonymous data lying around - i.e. data not assigned to any variable. The code will look a bit odd and won't do anything, but it won't break your code e.g. 
`[1,2,3];`

Functions are like any other variable, so they can also be used without being assigned a name: 
`function(a){return a;}`

Anonymous pieces of data scattered around your code though are only really useful if they happen to be functions: 

* Pass an anonymous function as a parameter to another function - `Callback functions`
* Or you can define an anonymous function and execute it right away - `Self-invoking functions`

Annoynmous functions are easy to change should the need arise, which comes in handy. 


#####Callback functions
So when you pass function B to function A, and A executes B, B is known as a callback function. If it doesn't have a name, it's an anonymous callback function. 
 
Callback functions:  

* Can help with performance - modifying functions so that they accept a callback functions, means you can cut down on the number of loops used - loops are expensive in programming terms! 
* You can delegate the responsibility of calling a function to another function (so less code to write)
* Allow you to pass functions without having to name those functions - which means there are less global variables

#####Self-invoking anonymous functions

Self-invoking is another application of an anonymous function. So a self invoking anonymous function has no name and runs immediately/automatically when you create it. 

The key thing to remember here is that javascript functions run immediately when you put () after them - for example doStuff(); Likewise with self invoking anonymous functions, they have the () at the end, and so run automatically/immediately. 


	(
		function(){
			alert('boo');
		}
	)()

The final set of parentheses say 'execute now'. This is also the place to put any parameters that your anonymous function might accept. 

	(
		function(name){
			alert('Hello' + name + '!');
		}
	)('dude')
	
Plus point for using self-invoking anonymous functions: 

* Get some work done without creating global variables
* However, you cannot execute the same function twice though, unless you put it inside a loop or another function. Therefore, the anonymous self-invoking function is best suited for one-off or initialisation tasks.

####Self Executing Functions
You can also have self-executing functions - these are named functions that execute immediately/automatically. 

For more on this stuff, read <https://sarfraznawaz.wordpress.com/2012/01/26/javascript-self-invoking-functions/>


##Inner (Private) Functions
Bearing in mind that a function is just like any other value, there's nothing stopping you defining a function inside another function. 

So if you had two functions, one inside the other, you'd consider the outer function the global function. When you call the global function, it will internally call the local function. Since the local function is not accessible outside the outer/global function, we call it a private function. 

This can be a powerful thing to do: 

* For privacy reasons - you expose (to the 'outside world') only the functions you decide to - keeping to yourself functionality that is not meant to be consumed by the rest of the application. 
* You also keep the global namespace clean - so a smaller chance of naming collisions. 

e.g. 

	function a(param){
		function b(theinput){
			return theinput * 2;
		};
		return 'The result is ' + b(param);
	};
	