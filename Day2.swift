//COMPLEX DATA TYPES


//Arrays are collections of values that are stored as a single value.

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

print(beatles[0])  // "John Lennon"


/*Sets are collections of values just like arrays, except they have two differences:

 Items aren’t stored in any order; they are stored in what is effectively a random order.
 No item can appear twice in a set; all items must be unique.
 
 You can create sets directly from arrays
 */

let colors = Set(["red","green","blue"])
let colors2 = Set(["red","green","blue","red","blue"])

for i in colors{
    print(i)
}

if colors.contains("red"){
    print("Red is exist in the set")
}

/*Tuples allow you to store several values together in a single value. That might sound like arrays, but tuples are different:
 
 You can’t add or remove items from a tuple; they are fixed in size.
 You can’t change the type of items in a tuple; they always have the same types they were created with.
 You can access items in a tuple using numerical positions or by naming them, but Swift won’t let you read numbers or names that don’t exist.
 
 */
var name = ( first : "Taylor" , last : "Swift" )
print(name.0)
print(name.last)

//Remember, you can change the values inside a tuple after you create it, but not the types of values. So, if you tried to change name to be (first: "Justin", age: 25) you would get an error.
name.0 = "Justin"
name.1 = "Timberlake"
print("\(name.0) \(name.1)")


//Arrays vs sets vs tuples

//If you need a specific, fixed collection of related values where each item has a precise position or name, you should use a tuple:
let address = (house:255, street:"Taylor Swift Avenue", city:"Nashville")

//If you need a collection of values that must be unique or you need to be able to check whether a specific item is in there extremely quickly, you should use a set:
let set = Set(["aardvark","astrontaut","azalea"])

//If you need a collection of values that can contain duplicates, or the order of your items matters, you should use an array:
let pythons = ["Eric","Graham","John","Michael","Terry","Terry"]


//Dictionaries
/*Dictionaries are collections of values just like arrays, but rather than storing things with an integer position you can access them using anything you want.
 
 The most common way of storing dictionary data is using strings.
 */
let heights = [
    "Taylor Swift" : 1.78,
    "Ed Sheeran" : 1.73

]
//These identifiers are called keys, and you can use them to read data back out of the dictionary:
print(heights["Taylor Swift"])


//Dictionary default values
let favoriteIceCreams = [
    "Paul" : "Chocolate",
    "Sophie" : "Vanilla"
]

//We can read Paul’s favorite ice cream like this:
print(favoriteIceCreams["Paul"] ?? 0.0)// with ?? 0.0 we can get rid of Optional()
print(favoriteIceCreams["Charlotte"])//But if we tried reading the favorite ice cream for Charlotte, we’d get back nil, meaning that Swift doesn’t have a value for that key:


favoriteIceCreams["Charlotte", default: "Unknown"]/* favoriteIceCreams["Charlotte", default: "Unknown"] returns "Unknown" temporarily.
                                                   If we try to access favoriteIceCreams["Charlotte"] directly, it returns nil because "Charlotte" is not a key in the dictionary.
                                                   Also, since the dictionary is declared with let, it is immutable, so we cannot add "Charlotte" permanently.*/
print(favoriteIceCreams["Charlotte", default: "Unknown"])



// Creating empty
/*
 Arrays, sets, and dictionaries are called collections, because they collect values together in one place.

 If you want to create an empty collection just write its type followed by opening and closing parentheses. For example, we can create an empty dictionary with strings for keys and values like this:
 */

var teams = [String : String]()
//We can then add entries later on, like this:
teams["Paul"] = "Red"

//Similarly, you can create an empty array to store integers like this:
var results = [Int]()

//The exception is creating an empty set, which is done differently:
var words = Set<String>()
var numbers = Set<Int>()

//This is because Swift has special syntax only for dictionaries and arrays; other types must use angle bracket syntax like sets.
//If you wanted, you could create arrays and dictionaries with similar syntax:
var scores = Dictionary<String, Int>()
var results2 = Array<Int>()

//Enumerations
//Enumerations – usually called just enums – are a way of defining groups of related values in a way that makes them easier to use.
//For example, if you wanted to write some code to represent the success or failure of some work you were doing, you could represent that as strings:
let result1 = "failure"
//But what happens if someone accidentally uses different naming?
let result2 = "failed"
let result3 = "fail"

//All those three are different strings, so they mean different things.
//With enums we can define a Result type that can be either success or failure, like this:

enum Result{
    case success
    case failure
}
//And now when we use it we must choose one of those two values:
let result4 = Result.failure
print(result4)

//As well as storing a simple value, enums can also store associated values attached to each case. This lets you attach additional information to your enums

enum Activity{
    case bored
    case running(destination : String)
    case talking(topic : String)
    case singing(volume : Int)
}
//Now we can be more precise – we can say that someone is talking about football:

let talking = Activity.talking(topic :"Football")
print(talking)

//Sometimes you need to be able to assign values to enums so they have meaning. This lets you create them dynamically, and also use them in different ways.

//For example, you might create a Planet enum that stores integer values for each of its cases:
/*enum Planet : Int{
    case mercury
    case venus
    case earth
    case mars
}
 */
//Swift will automatically assign each of those a number starting from 0, and you can use that number to create an instance of the appropriate enum case.

let earth = Planet(rawValue: 2)
//If you want, you can assign one or more cases a specific value, and Swift will generate the rest. It’s not very natural for us to think of Earth as the second planet, so you could write this:
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
//Now Swift will assign 1 to mercury and count upwards from there, meaning that earth is now the third planet.
print(Planet.earth.rawValue)

//Summary
/*
 
 1)Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 2)Arrays store items in the order you add them, and you access them using numerical positions.
 3)Sets store items without any order, so you can’t access them using numerical positions.
 4)Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 5)Dictionaries store items according to a key, and you can read items using those keys.
 6)Enums are a way of grouping related values so you can use them without spelling mistakes.
 7)You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 
 */


