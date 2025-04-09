/*
 1)Operators
 2)Conditions
 */


/*
let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore// add +
let difference = firstScore - secondScore// subtract -
let product = firstScore * secondScore//multiply *
let divided = firstScore / secondScore// divide /
let remainder = 13 % secondScore// mod
*/

//Operator Overloading:Swift supports operator overloading, which is a fancy way of saying that what an operator does depends on the values you use it with.

let meaningOfLife = 42
let doubleMeaning = 42 + 42

//But + also joins strings,
let fakers = "Fakers gonna "
let action = fakers + "fake"
print(action)

//You can even use + to join arrays

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf
for i in beatles{print(i)}

//Compound Assignment Operators

var score = 95
score -= 5
//Similarly, you can add one string to another using +=:
var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

//Comparison Operators
let firstScore = 6
let secondScore = 4
print(firstScore == secondScore)
print(firstScore != secondScore)// I got error when I wrote firstScore!=secondScore), i need to pass blank space
print(firstScore <= secondScore)
print(firstScore >= secondScore)
print("Taylor" >= "Swift")



//Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

//Swift has two special operators that let us combine conditions together: they are && (pronounced “and”) and || (pronounced “or”).

let age1 = 12
let age2 = 21
if age1 > 18 && age2 > 18{
    print("Both are over 18")
}
else if (age1 > 18 || age2 > 18) {
    print("At least one is over 18")
}
else{
    print("Both are not over 18")
}



// The Ternary Operator
let firstNumber = 11
let secondNumber = 10
print(firstNumber == secondNumber ? "Number are the same" : "Numbers are different")
/*It is same as below code snippets
 if firstCard == secondCard {
     print("Cards are the same")
 } else {
     print("Cards are different")
 }
 */

// Switch Statements : If you have several conditions using if and else if, it’s often clearer to use a different construct known as switch case. Using this approach you write your condition once, then list all possible outcomes and what should happen for each of them.

let weather = "sunny"
switch weather{
    
    case "rain":
    print("Bring an umbrella")
    
    case "snow":
    print("Wrap up warm")
    
    case "sunny":
    print("Wear sunscreen")
    fallthrough
    
    default:
        print("Enjoy your day!")
    
//In that example, the last case – default – is required because Swift makes sure you cover all possible cases so that no eventuality is missed off. If the weather is anything other than rain, snow, or sun, the default case will be run.
    
//Swift will only run the code inside each case. If you want execution to continue on to the next case, use the fallthrough keyword like this:
}


// Range Operators
/*
 Swift gives us two ways of making ranges: the ..< and ... operators. The half-open range operator, ..<, creates ranges up to but excluding the final value, and the closed range operator, ..., creates ranges up to and including the final value.

 For example, the range 1..<5 contains the numbers 1, 2, 3, and 4, whereas the range 1...5 contains the numbers 1, 2, 3, 4, and 5.
 */

let number = 85

switch score{
    
case ..<50:
    print("You failed badly.")

case ..<85:
    print("You did OK.")

default:
    print("You did great!")
}
//As before, the default case must be there to ensure all possible values are covered.

/*
 
 1)Swift has operators for doing arithmetic and for comparison; they mostly work like you already know.
 2)There are compound variants of arithmetic operators that modify their variables in place: +=, -=, and so on.
 3)You can use if, else, and else if to run code based on the result of a condition.
 4)Swift has a ternary operator that combines a check with true and false code blocks. Although you might see it in other code, I wouldn’t recommend using it yourself.
 5)If you have multiple conditions using the same value, it’s often clearer to use switch instead.
 6)You can make ranges using ..< and ... depending on whether the last number should be excluded or included.
 
 
 */

