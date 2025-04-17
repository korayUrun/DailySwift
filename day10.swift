// Classes


//Creating your own classes: The first difference between classes and structs is that classes never come with a memberwise initializer. This means if you have properties in your class, you must always create your own initializer.

/*
class Dog {
    var name : String
    var breed : String
    
    init(name : String , breed : String ) {
        self.name = name
        self.breed = breed
    }
}

//Creating instances of that class looks just the same as if it were a struct:
let poppy = Dog(name : "Poppy" , breed : "Poodle" )
*/


//Class inheritance,The second difference between classes and structs is that you can create a class based on an existing class – it inherits all the properties and methods of the original class, and can add its own on top.                                         This is called class inheritance or subclassing, the class you inherit from is called the “parent” or “super” class, and the new class is called the “child” class.

//We could create a new class based on that one called Poodle. It will inherit the same properties and initializer as Dog by default:

/*class Poodle : Dog {
    init(name : String){
        super.init(name: name, breed:"Poodle")
    }
}*/



//Overriding methods : Child classes can replace parent methods with their own implementations – a process known as overriding.

/*
class Dog {
    func makeNoise(){
        print("Woof")
    }
}
 */

 /*
class Poodle : Dog {
    
}

let poppy = Poodle()
poppy.makeNoise()
*/

//Method overriding allows us to change the implementation of makeNoise() for the Poodle class.                                         Swift requires us to use override func rather than just func when overriding a method – it stops you from overriding a method by accident, and you’ll get an error if you try to override something that doesn’t exist on the parent class:

/*class Poodle : Dog {
    override func makeNoise(){
        print("Yip!")
    }
}
*/


// FINAL CLASSES : Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it. This means they can’t override your methods in order to change your behavior – they need to use your class the way it was written.

final class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
}


//Copying objects : The third difference between classes and structs is how they are copied. When you copy a struct, both the original and the copy are different things – changing one won’t change the other. When you copy a class, both the original and the copy point to the same thing, so changing one does change the other.

class Singer {
    var name = "Taylor Swift"
}
//If we create an instance of that class and prints its name, we’ll get “Taylor Swift”:

var singer = Singer()
print(singer.name)
//Now let’s create a second variable from the first one and change its name:

var singerCopy = singer
singerCopy.name = "Justin Bieber"

//Because of the way classes work, both singer and singerCopy point to the same object in memory, so when we print the singer name again we’ll see “Justin Bieber”:
print(singer.name)


//Deinitializers : The fourth difference between classes and structs is that classes can have deinitializers – code that gets run when an instance of a class is destroyed.

class Person {
    var name = "John Doe"

    init() {
        print("\(name) is alive!")
    }

    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    ////And now for the deinitializer. This will be called when the Person instance is being destroyed:
    deinit {
        print("\(name) is no more!")
    }
}
//We’re going to create a few instances of the Person class inside a loop, because each time the loop goes around a new person will be created then destroyed:

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}


//Mutability : The final difference between classes and structs is the way they deal with constants. If you have a constant struct with a variable property, that property can’t be changed because the struct itself is constant.                                           However, if you have a constant class with a variable property, that property can be changed.                                          With the usage of let and var keyword we can clearly handle this subject.




/*
 1.Classes and structs are similar, in that they can both let you create your own types with properties and methods.
 
 2.One class can inherit from another, and it gains all the properties and methods of the parent class. It’s common to talk about class hierarchies – one class based on another, which itself is based on another.
 
 3.You can mark a class with the final keyword, which stops other classes from inheriting from it.
 
 4.Method overriding lets a child class replace a method in its parent class with a new implementation.
 
 5.When two variables point at the same class instance, they both point at the same piece of memory – changing one changes the other.
 
 6.Classes can have a deinitializer, which is code that gets run when an instance of the class is destroyed.
 
 7.Classes don’t enforce constants as strongly as structs – if a property is declared as a variable, it can be changed regardless of how the class instance was created.
 */
