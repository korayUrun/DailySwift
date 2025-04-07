/*
1)Variables
2)Strings and Integers
3)Multi-line Strings
4)Doubles and Booleans
5)String Interpolation
6)Constants
7)Type Annotations
*/


//Variables
var str = "Hello,playground"
print(str)
str = "Goodbye"

/*String and Integers
 Swift is what’s known as a type-safe language, which means that every variable must be of one specific type. The str variable that Xcode created for us holds a string of letters that spell “Hello, playground”, so Swift assigns it the type String.
*/

var age = 38
//That holds a whole number, so Swift assigns the type Int – short for “integer”.


//If you have large numbers, Swift lets you use underscores as thousands separators – they don’t change the number, but they do make it easier to read.

var population = 8_000_000

/*Multiline Strings
 Standard Swift strings use double quotes, but you can’t include line breaks in there.
 
 If you want multi-line strings you need slightly different syntax: start and end with three double quote marks */

var str1 = """
This goes 
over multiple 
lines
"""
print(str1)

/* If you only want multi-line strings to format your code neatly, and you don’t want those line breaks to actually be in your string, end each line with a \
 */

var str2 = """
This goes \
over multiple \
lines
"""
print(str2)

//Whenever you create a variable with a fractional number, Swift automatically gives that variable the type Double
//Double
var pi = 3.141

//As for booleans, they are much simpler: they just hold either true or false
//Boolean
var awesome = true


//String Interpolation : the ability to place variables inside your strings to make them more useful.

//You can place any type of variable inside your string – all you have to do is write a backslash, \, followed by your variable name in parentheses.

var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"
print(results)


/*Constants

 The let keyword creates constants, which are values that can be set once and never again.
 
 If you try to change that, Xcode will refuse to run your code. It’s a form of safety: when you use constants you can no longer change something by accident.

 When you write your own Swift code, you should always use let unless you specifically want to change a value.
 */

let taylor = "swift"

/*Type Annotations
 
 Swift assigns each variable and constant a type based on what value it’s given when it’s created.
 So, when you write code like this Swift can see it holds a string:

 let str = "Hello, playground"
 
 That will make str a string, so you can’t try to assign it an integer or a boolean later on. This is called TYPE INFERENCE: Swift is able to infer the type of something based on how you created it.
 
 If you want you can be explicit about the type of your data rather than relying on Swift’s type inference,
 
 let album: String = "Reputation"
 let year: Int = 1989
 let height: Double = 1.78
 let taylorRocks: Bool = true
 */


/*
SUMMARY FOR DAY 1
 1)You make variables using var and constants using let.
 2)Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.
 3)Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
 
 4)String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
 
 5)Swift uses type inference to assign each variable or constant a type, but you can provide explicit types if you want.
 
 
 */
