
//LOOPS


//For loops
//here’s a range of numbers:

/*
let count = 1...10
for number in count{
    print("Number is \(number)")
}
*/

/*We can do the same with arrays:
let albums = ["red" , "1989" , "Reputation"]
for album in albums {
    print("\(album) is on Apple Music")
}*/

//If you don’t use the constant that for loops give you, you should use an underscore instead so that Swift doesn’t create needless values:

/*print("Players gonna ")
for _ in 1...3{
    print("play")
}*/

//WHILE LOOP

/*
var number = 1
while number <= 20{
    print(number)
    number+=1
}
print("Ready or not, here I come!")
*/


//Repeat loops : The third way of writing loops is not commonly used, but it’s so simple to learn we might as well cover it: it’s called the repeat loop, and it’s identical to a while loop except the condition to check comes at the end.

/*
var number = 1
repeat{
    print(number)
    number+=1
} while number <= 20
print("Ready or not, here I come!")
 */

//this print() function will be run once, because repeat only fails the condition after the loop runs:
// it same as java's do-while statement
repeat {
    print("This is false")
} while false


// Exiting loops : You can exit a loop at any time using the break keyword. To try this out, let’s start with a regular while loop that counts down for a rocket launch:

/*
var countDown = 10
while countDown >= 0 {
    print(countDown)

    if countDown == 4 {
        print("I'm bored. Let's go now!")
        break
    }

    countDown -= 1
}*/

//Exiting Multiple Loops
//If you put a loop inside a loop it’s called a nested loop, and it’s not uncommon to want to break out of both the inner loop and the outer loop at the same time.

/*for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
}
 */

//If we wanted to exit part-way through we need to do two things. First, we give the outside loop a label, like this:

/*outerLoop: for i in 1...10{
    for j in 1...10{
        let product = i * j
        print ("\(i) * \(j) is \(product)")
    }
    
}
 */
//Second, add our condition inside the inner loop, then use break outerLoop to exit both loops at the same time:
/*
outerLoop: for i in 1...10 {
    
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
*/
//With a regular break, only the inner loop would be exited – the outer loop would continue where it left off.


//Skipping items
//As you’ve seen, the break keyword exits a loop. But if you just want to skip the current item and continue on to the next one, you should use continue instead.


for i in 1...5{

    if i % 2 == 0{
        continue
    }
    print(i)
}

var counter = 0

while true {
    print("5")
    counter += 1

    if counter == 273 {
        break
    }
}

/*
 1)Loops let us repeat code until a condition is false.
 2)The most common loop is for, which assigns each item inside the loop to a temporary constant.
 3)If you don’t need the temporary constant that for loops give you, use an underscore instead so Swift can skip that work.
 4)There are while loops, which you provide with an explicit condition to check.
 5)Although they are similar to while loops, repeat loops always run the body of their loop at least once.
 6)You can exit a single loop using break, but if you have nested loops you need to use break followed by whatever label you placed before your outer loop.
 7)You can skip items in a loop using continue.
 8)Infinite loops don’t end until you ask them to, and are made using while true. Make sure you have a condition somewhere to end your infinite loops!
 */
