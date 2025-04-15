// Structs,properties,methods ,access control, static properties, and laziness

//Creating your own structs
/*
 Swift lets you design your own types in two ways, of which the most common are called structures, or just structs. Structs can be given their own variables and constants, and their own functions, then created and used however you want.

 Let’s start with a simple example: we’re going to create a Sport struct that stores its name as a string. Variables inside structs are called properties, so this is a struct with one property:
 */

/*struct Sport{
    var name : String
}
//That defines the type, so now we can create and use an instance of it:

var tennis = Sport(name: "Tennis")
print(tennis.name)
//We made both name and tennis variable, so we can change them just like regular variables:
tennis.name = "Lawn tennis"
print(tennis.name)
//Properties can have default values just like regular variables, and you can usually rely on Swift’s type inference.
*/

//Computed properties
//struct Sport {
//    var name: String
//}

//That has a name property that stores a String. These are called stored properties, because Swift has a different kind of property called a computed property – a property that runs code to figure out its value.
//We’re going to add another stored property to the Sport struct, then a computed property.

struct Sport{
    var name : String
    var isOlympicSport : Bool
    
    var olympicStatus : String{
        if isOlympicSport{
            return "\(name) is an Olympic sport"
        }
        else {
                    return "\(name) is not an Olympic sport"
                }
    }
}
//As you can see, olympicStatus looks like a regular String, but it returns different values depending on the other properties.         We can try it out by creating a new instance of Sport:

let chessBoxing = Sport(name : "ChessBoxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)


//Property observers
//Property observers let you run code before or after any property changes. To demonstrate this, we’ll write a Progress struct that tracks a task and a completion percentage:

struct Progress {
    var task : String
    var amount : Int{
        didSet{
            print("\(task) is now \(amount)% complete")
        }
    }
    
    
    
}//We can now create an instance of that struct and adjust its progress over time:

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//What we want to happen is for Swift to print a message every time amount changes, and we can use a didSet property observer for that. This will run some code every time amount changes:

//You can also use willSet to take action before a property changes, but that is rarely used.


//Methods

/*
 Structs can have functions inside them, and those functions can use the properties of the struct as they need to. Functions inside structs are called methods, but they still use the same func keyword.

 We can demonstrate this with a City struct. This will have a population property that stores how many people are in the city, plus a collectTaxes() method that returns the population count multiplied by 1000. Because the method belongs to City it can read the current city’s population property.
 */

struct City{
    var population: Int
    
    func collectTaxes() -> Int{
        return population * 1000
    }
}
//That method belongs to the struct, so we call it on instances of the struct like this:
let london = City(population: 9_000_000)
print(london.collectTaxes())


//Mutating Methods

/*
 If a struct has a variable property but the instance of the struct was created as a constant, that property can’t be changed – the struct is constant, so all its properties are also constant regardless of how they were created.

 The problem is that when you create the struct Swift has no idea whether you will use it with constants or variables, so by default it takes the safe approach: Swift won’t let you write methods that change properties unless you specifically request it.

 When you want to change a property inside a method, you need to mark it using the mutating keyword
 */

/*
struct Person{
    var name : String
    
    mutating func makeAnonymous(){
        name = "Anonymous"
    }
}
*/
//Because it changes the property, Swift will only allow that method to be called on Person instances that are variables:

//var person = Person(name: "Ed")
//person.makeAnonymous()



//Properties and methods of strings
let string = "Do or do not, there is no try."
//you can read the number of characters in a string using its count property:
print(string.count)
//They have a hasPrefix() method that returns true if the string starts with specific letters:
print(string.hasPrefix("Do"))
//You can uppercase a string by calling its uppercased() method:
print(string.uppercased())
//And you can even have Swift sort the letters of the string into an array:
print(string.sorted())


//Properties and methods of arrays
//Arrays are also structs, which means they too have their own methods and properties we can use to query and manipulate the array.

var toys = ["Woody"]
//you can read the number of items in an array using its count property
print(toys.count)

//If you want to add a new item, use the append() method like this:
toys.append("Buzz")

//You can locate any item inside an array using its firstIndex() method, like this:
toys.firstIndex(of: "Buzz")

//That will return 1 because arrays count from 0.   Just like with strings, you can have Swift sort the items of the array alphabetically:
print(toys.sorted())

//Finally, if you want to remove an item, use the remove() method like this:
toys.remove(at: 0)




//Initializers
//Initializers are special methods that provide different ways to create your struct. All structs come with one by default, called their memberwise initializer – this asks you to provide a value for each property when you create the struct.


//You can see this if we create a User struct that has one property:

/*
struct User{
    var username : String
}
//When we create one of those structs, we must provide a username:
var user = User(username: "twostraws")
*/

//We can provide our own initializer to replace the default one. For example, we might want to create all new users as “Anonymous” and print a message, like this:

struct User{
    var username : String
    
    init(){
        username = "Anoynmous"
        print("Creating a new user!")
    }
}

//You don’t write func before initializers, but you do need to make sure all properties have a value before the initializer ends.

//Now our initializer accepts no parameters, we need to create the struct like this:
var user = User()
user.username = "twostraws"


//Referring to the current instance

/*struct Person {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}*/

//Lazy properties

//As a performance optimization, Swift lets you create some properties only when they are needed. As an example, consider this FamilyTree struct – it doesn’t do much, but in theory creating a family tree for someone takes a long time:

/*struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

//We might use that FamilyTree struct as a property inside a Person struct, like this:

struct Person{
    var name : String
    var familyTree = FamilyTree()
    
    init(name: String) {
            self.name = name
        }
}

var ed = Person(name: "Ed")
*/
 
//But what if we didn’t always need the family tree for a particular person? If we add the lazy keyword to the familyTree property, then Swift will only create the FamilyTree struct when it’s first accessed:
//    lazy var familyTree = FamilyTree()
//So, if you want to see the “Creating family tree!” message, you need to access the property at least once:

//ed.familyTree

//All the properties and methods we’ve created so far have belonged to individual instances of structs, which means that if we had a Student struct we could create several student instances each with their own properties and methods:

/*struct Student {
    var name: String

    init(name: String) {
        self.name = name
    }
}

let ed = Student(name: "Ed")
let taylor = Student(name: "Taylor")

*/
//You can also ask Swift to share specific properties and methods across all instances of the struct by declaring them as static.       To try this out, we’re going to add a static property to the Student struct to store how many students are in the class. Each time we create a new student, we’ll add one to it:

struct Student {
    static var classSize = 0 //Static property 'classSize' is not concurrency-safe because it is nonisolated global shared mutable state
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

//Because the classSize property belongs to the struct itself rather than instances of the struct, we need to read it using Student.classSize:
print(Student.classSize)


//Access control

//ccess control lets you restrict which code can use properties and methods. This is important because you might want to stop people reading a property directly, for example.                                                                                          We could create a Person struct that has an id property to store their social security number:


/*struct Person {
    var id: String

    init(id: String) {
        self.id = id
    }
}

let ed = Person(id: "12345")

*/


//Once that person has been created, we can make their id be private so you can’t read it from outside the struct – trying to write ed.id simply won’t work.
//Just use the private keyword, like this:

/*struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }
}*/


//Now only methods inside Person can read the id property. For example:

struct Person {
    private var id: String

    init(id: String) {
        self.id = id
    }

    func identify() -> String {
        return "My social security number is \(id)"
    }
}
//Another common option is public, which lets all other code use the property or method.


/*
 
 
 1.You can create your own types using structures, which can have their own properties and methods.
 2.You can use stored properties or use computed properties to calculate values on the fly.
 3.If you want to change a property inside a method, you must mark it as mutating.
 4.Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
 5.Use the self constant to refer to the current instance of a struct inside a method.
 6.The lazy keyword tells Swift to create properties only when they are first used.
 7.You can share properties and methods across all instances of a struct using the static keyword.
 8.Access control lets you restrict what code can use properties and methods.
 
 
 */
