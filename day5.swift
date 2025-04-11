//FUNCTIONS
//Functions let us re-use code, which means we can write a function to do something interesting then run that function from lots of places. Repeating code is generally a bad idea, and functions help us avoid doing that.

//Swift functions start with the func keyword, then your function name, then open and close parentheses. All the body of your function – the code that should be run when the function is requested – is placed inside braces.

func sayHello(){
    print("Hello guys! I am a function")
}
sayHello()

//Accepting parameters

func square(number : Int){
    print(number * number)
}
square(number : 5)

//Returning values

/* As well as receiving data, functions can also send back data. To do this, write a dash then a right angle bracket after your function’s parameter list, then tell Swift what kind of data will be returned.
 
 Inside your function, you use the return keyword to send a value back if you have one. Your function then immediately exits, sending back that value – no other code from that function will be run.
 */

func cube(number : Int) -> Int{
    return number * number * number
}
print(cube(number: 3))


// Parameter Labels

func sayBye(to name : String){
    print("Goodby \(name)")
}
sayBye(to: "John")
//The parameter is called to name, which means externally it’s called to, but internally it’s called name.
 //Swift lets us provide two names for each parameter: one to be used externally when calling the function, and one to be used internally inside the function. This is as simple as writing two names, separated by a space.
// we can use any word instead of to , it is up to us


// Ommiting parameter labels
/*func greet(_ person:String){
    print("Hello \(person)")
}
greet("Taylor")*/




//Default Parameters
/*
 The print() function prints something to the screen, but always adds a new line to the end of whatever you printed, so that multiple calls to print() don’t all appear on the same line.

 You can change that behavior if you want, so you could use spaces rather than line breaks. Most of the time, though, folks want new lines, so print() has a terminator parameter that uses new line as its default value.

 You can give your own parameters a default value just by writing an = after its type followed by the default you want to give it.
 */

func greet (_ person:String , nicely : Bool = true){
    if nicely == true{
        print("Hello \(person) !")
    }
    else{
        print("Oh no, it's \(person) again...")
    }
}
greet("Taylor")
greet("Taylor",nicely : false)


// Variadic functions :Some functions are variadic, which is a fancy way of saying they accept any number of parameters of the same type. The print() function is actually variadic: if you pass lots of parameters, they are all printed on one line with spaces between them:

print("Haters","gonna","hate")
/*
 You can make any parameter variadic by writing ... after its type. So, an Int parameter is a single integer, whereas Int... is zero or more integers – potentially hundreds.

 Inside the function, Swift converts the values that were passed in to an array of integers, so you can loop over them as needed.
 */

func square(numbers : Int...){
    for number in numbers{
        print("\(number) squared is \(number*number)")
    }
}
square(numbers:5,6,7,8,9,10)


//Writing throwing functions
/*
 Sometimes functions fail because they have bad input, or because something went wrong internally. Swift lets us throw errors from functions by marking them as throws before their return type, then using the throw keyword when something goes wrong.

 First we need to define an enum that describes the errors we can throw. These must always be based on Swift’s existing Error type. We’re going to write a function that checks whether a password is good, so we’ll throw an error if the user tries an obvious password:
 */

enum PasswordError : Error{
    case obvious
}

//Now we’ll write a checkPassword() function that will throw that error if something goes wrong. This means using the throws keyword before the function’s return value, then using throw PasswordError.obvious if their password is “password”.

func checkPassword(_ password : String) throws -> Bool{
    if password == "password"{
       throw PasswordError.obvious
    }
    return true
}

//Running throwing functions

/*
 you need to call these functions using three new keywords: do starts a section of code that might cause problems, try is used before every function that might throw an error, and catch lets you handle errors gracefully.

 If any errors are thrown inside the do block, execution immediately jumps to the catch block. Let’s try calling checkPassword() with a parameter that throws an error:
 */

do
{
    try checkPassword("password")
    print("That pasword is good")
}catch {
    print("You can't use that password")
}

/* also we can keep the value of the try statement
 do {
     let result = try checkPassword("password")
     print("Password is acceptable: \(result)")
 } catch {
     print("You can't use that password!")
 }
 */

// inout parameters : All parameters passed into a Swift function are constants, so you can’t change them. If you want, you can pass in one or more parameters as inout, which means they can be changed inside your function, and those changes reflect in the original value outside the function.To use that, you first need to make a variable integer – you can’t use constant integers with inout, because they might be changed. You also need to pass the parameter to doubleInPlace using an ampersand, &, before its name, which is an explicit recognition that you’re aware it is being used as inout.

func doubleInPlace(_ number : inout Int ){
    number *= 2
}
var myNum=10
doubleInPlace(&myNum)
print(myNum)


/*
 1)Functions let us re-use code without repeating ourselves.
 2)Functions can accept parameters – just tell Swift the type of each parameter.
 3)Functions can return values, and again you just specify what type will be sent back. Use tuples if you want to return several things.
 4)You can use different names for parameters externally and internally, or omit the external name entirely.
 5)Parameters can have default values, which helps you write less code when specific values are common.
 6)Variadic functions accept zero or more of a specific parameter, and Swift converts the input to an array.
 7)Functions can throw errors, but you must call them using try and handle errors using catch.
 8)You can use inout to change variables inside a function, but it’s usually better to return a new value.
 */
