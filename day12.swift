//Optionals,unwrapping,typecasting

//Handling missing data
//var age: Int? = nil
//age = 38

//Unwrapping optionals
var name: String? = nil

//A common way of unwrapping optionals is with if let syntax, which unwraps with a condition. If there was a value inside the optional then you can use it, but if there wasn’t the condition fails.

if let unwrappedName = name{
    print("\(unwrappedName.count) letters")
}else {
    print("Missing name.")
}
//If name holds a string, it will be put inside unwrapped as a regular String and we can read its count property inside the condition. Alternatively, if name is empty, the else code will be run.



//Unwrapping with guard
//An alternative to if let is guard let, which also unwraps optionals. guard let will unwrap an optional for you, but if it finds nil inside it expects you to exit the function, loop, or condition you used it in.However, the major difference between if let and guard let is that your unwrapped optional remains usable after the guard code.

func greet(_ name : String?){
    guard let unwrapped = name else{
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}

greet("Alice")

/*
 🔹 if let :
The unwrapped variable is only valid inside the if let block.
You can’t use it outside the block.
*/

/*
 🔹 guard let explanation in English:
 If unwrapping fails, the code will perform an early exit (like return, break, or continue).
 If unwrapping is successful, the unwrapped variable can be used for the rest of the function.
*/



//Force Unwrapping,                                                                                                                 Optionals represent data that may or may not be there, but sometimes you know for sure that a value isn’t nil. In these cases, Swift lets you force unwrap the optional: convert it from an optional type to a non-optional type.
let str = "5"
//let num = Int(str)
print(num)

//That makes num an optional Int because you might have tried to convert a string like “Fish” rather than “5”.                       Even though Swift isn’t sure the conversion will work, you can see the code is safe so you can force unwrap the result by writing ! after Int(str)

let num = Int(str)!
print(num)



//Implicitly unwrapped optionals,Like regular optionals, implicitly unwrapped optionals might contain a value or they might be nil. However, unlike regular optionals you don’t need to unwrap them in order to use them: you can use them as if they weren’t optional at all.Implicitly unwrapped optionals are created by adding an exclamation mark after your type name

let age: Int! = nil
//Because they behave as if they were already unwrapped, you don’t need if let or guard let to use implicitly unwrapped optionals. However, if you try to use them and they have no value – if they are nil – your code crashes.



//Nil coalescing,The nil coalescing operator unwraps an optional and returns the value inside if there is one. If there isn’t a value – if the optional was nil – then a default value is used instead. Either way, the result won’t be optional: it will either be the value from inside the optional or the default value used as a backup.

func username(for id : Int) -> String?{
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

//If we call that with ID 15 we’ll get back nil because the user isn’t recognized, but with nil coalescing we can provide a default value of “Anonymous” like this:


let user = username(for : 15) ?? "Anonymous"
print(user)
//That will check the result that comes back from the username() function: if it’s a string then it will be unwrapped and placed into user, but if it has nil inside then “Anonymous” will be used instead.




//Optional chaining                                                                                                                  Swift provides us with a shortcut when using optionals: if you want to access something like a.b.c and b is optional, you can write a question mark after it to enable optional chaining: a.b?.c.When that code is run, Swift will check whether b has a value, and if it’s nil the rest of the line will be ignored – Swift will return nil immediately. But if it has a value, it will be unwrapped and execution will continue.
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
print(beatle)



//Optional try
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

//checkPassword("password")

//That runs a throwing function, using do, try, and catch to handle errors gracefully.

//The first is try?, and changes throwing functions into functions that return an optional. If the function throws an error you’ll be sent nil as the result, otherwise you’ll get the return value wrapped as an optional.

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}



//Failable initializers
//When talking about force unwrapping, I used this code:
let str = "5"
let num = Int(str)
/*
 That converts a string to an integer, but because you might try to pass any string there what you actually get back is an optional integer.

 This is a failable initializer: an initializer that might work or might not. You can write these in your own structs and classes by using init?() rather than init(), and return nil if something goes wrong. The return value will then be an optional of your type, for you to unwrap however you want.

 As an example, we could code a Person struct that must be created using a nine-letter ID string. If anything other than a nine-letter string is used we’ll return nil, otherwise we’ll continue as normal.
 */

struct Person{
    var id : String
    
    init?(id : String){
        if id.count == 9 {
            self.id = id
        }
        else{
            return nil
        }
    }
}

//Typecasting

class Animal {}

class Fish : Animal{}

class Dog : Animal{
    func makeNoise(){
        print("Woof!!!")
    }
}
//We can create a couple of fish and a couple of dogs, and put them into an array, like this:
//If we want to loop over the pets array and ask all the dogs to bark, we need to perform a typecast: Swift will check to see whether each pet is a Dog object, and if it is we can then call makeNoise().This uses a new keyword called as?, which returns an optional: it will be nil if the typecast failed, or a converted type otherwise.

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets{
    if let dog = pet as? Dog{
        dog.makeNoise()
    }
}


/*
 SUMMARY
 1.Optionals let us represent the absence of a value in a clear and unambiguous way.
 2.Swift won’t let us use optionals without unwrapping them, either using if let or using guard let.
 3.You can force unwrap optionals with an exclamation mark, but if you try to force unwrap nil your code will crash.
 4.Implicitly unwrapped optionals don’t have the safety checks of regular optionals.
 5.You can use nil coalescing to unwrap an optional and provide a default value if there was nothing inside.
 6.Optional chaining lets us write code to manipulate an optional, but if the optional turns out to be empty the code is ignored.
 7.You can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown.
 8.If you need your initializer to fail when it’s given bad input, use init?() to make a failable initializer.
 9.You can use typecasting to convert one type of object to another.
 
 */


