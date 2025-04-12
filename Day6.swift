//  Closures, part one

/*
 Swift lets us use functions just like any other type such as strings and integers. This means you can create a function and assign it to a variable, call that function using that variable, and even pass that function into other functions as parameters.

 Functions used in this way are called closures, and although they work like functions they are written a little differently.
 */

//let driving = {
//    print("I'm driving in my car")
//}
//That effectively creates a function without a name, and assigns that function to driving. You can now call driving() as if it were a regular function
//driving()

//Accepting parameters in a closure


/*
 
 When you create closures, they don’t have a name or space to write any parameters. That doesn’t mean they can’t accept parameters, just that they do so in a different way: they are listed inside the open braces.

 To make a closure accept parameters, list them inside parentheses just after the opening brace, then write in so that Swift knows the main body of the closure is starting.
*/
let driving2 = {(place : String) in
        print("I'm going to \(place) in my car")
}
driving2("London")


//Returning values from a closure
/*
 Closures can also return values, and they are written similarly to parameters: you write them inside your closure, directly before the in keyword.

 To demonstrate this, we’re going to take our driving() closure and make it return its value rather than print it directly.
 */

let drivingWithReturn = {(place : String) -> String in
        return "I'm going to \(place) in my car"
}
print(drivingWithReturn("home"))


//Closures as parameters
//Because closures can be used just like strings and integers, you can pass them into functions. The syntax for this can hurt your brain at first, so we’re going to take it slow.

let driving = {
    print("I'm driving in my car")
}

//If we wanted to pass that closure into a function so it can be run inside that function, we would specify the parameter type as () -> Void. That means “accepts no parameters, and returns Void” – Swift’s way of saying “nothing”.

func travel(action : () -> Void ){
    
    //So, we can write a travel() function that accepts different kinds of traveling actions, and prints a message before and after:
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
    
}
//travel(action : driving)


//Trailing closure syntax
//If the last parameter to a function is a closure, Swift lets you use special syntax called trailing closure syntax. Rather than pass in your closure as a parameter, you pass it directly after the function inside braces.

travel() {
    print("I'm driving in my car")
}

// In fact, because there aren’t any other parameters, we can eliminate the parentheses entirely:


travel {
    print("I'm driving in my car")
}
