//
//  main.swift
//  SwiftLearner
//
//  Created by Yusuf Turan on 3.02.2021.
//

import Foundation

/*
//////// DAY1 /////////
print("Expressions, Variables & Constants:")
/*
2+6		// OK
2 + 6	// OK
2 +6	// ERROR
2+ 6	// ERROR
*/

print (22/7)		//Output:3
print(22.0/7.0)		//Output: 3.142857142857143 //Use decimals when you need!

//Right Shift: >> and Left Shift: <<
print(1<<3)		//8
print(32>>2)	//8

print(sin(45 * Double.pi / 180)) //0.7071067811865475
print(cos(135 * Double.pi / 180)) //-0.7071067811865475

print((16.0).squareRoot()) //4

print(max(5,10))	//10
print(min(-5,-10))	//-10

//combine built-in functions:
print(max((16.0).squareRoot(), Double.pi))	//4.0

//Constants:
let pi: Double = 3.14159
let number: Int = 10
//number += 1 // => Not work. Cannot assign to value: 'number' is a 'let' constant


//Variables:
var myFavoriteNumber: Int = 42;
print(myFavoriteNumber)
myFavoriteNumber += 1;
print(myFavoriteNumber)
myFavoriteNumber = 10_000
print(myFavoriteNumber)

//Increment and decrement
var counter: Int = 0
counter += 1 // counter = 1
counter -= 1 // counter = 0


var randomNumber: UInt32 = arc4random()
print(randomNumber)

let diceRoll = Int.random(in: 1...6)
print(diceRoll)
print("---------------------------\n")

print("Types & Operations:")

var integerValue: Int = 100
var decimalValue: Double = 12.5
integerValue = Int(decimalValue)
print(integerValue)		//12

let hourlyRate: Double = 19.5
let hoursWorked: Int = 10
/* ERROR
let totalCost: Double = hourlyRate * hoursWorked
NOTE: Binary operator '*' cannot be applied to operands of type 'Double' and 'Int'
*/
let totalCost: Double = hourlyRate * Double(hoursWorked)
print(totalCost)


//String:
let characterA : Character = "a"
print(characterA)
//concatenation
var message = "Hello " + "my name is "
let name = "Yusuf"
message += name
print(message)

//Interpolation: "\(variable)"
message = "Hey yo! my name is \(name)"
print(message)

//This syntax works in the same way to build a string from other data types:
let oneThird = 1.0 / 3.0
let oneThirdLongString = "One third is \(oneThird) as a decimal."
print(oneThirdLongString)

let multiLineString = """
			You can have a string
			that contains multiple
			lines
			by
			doing this.
			"""
print(multiLineString)


//Tuples:
let coordinates: (Int, Int) = (5, 9)
let anotherWayCoordinates = (2, 3)
let doubleCoordinates = (2.1, 3)	//(Double, Int) mixed tuple.
print("X: \(doubleCoordinates.0)  and Y: \(doubleCoordinates.1)")

let coordinatesNamed = (x: 2, y: 3)
let xCoordinate = coordinatesNamed.x	//2
let yCoordinate = coordinatesNamed.y	//3

//Simple presentation of multiple parts of tuple:
let coordinates3D = (x: 2, y: 3, z: 1)
let (x3, y3, z3)  = coordinates3D
print("\(x3) \(y3) \(z3)")

//wildcard operator "_" : swift ingores this shit.
let (x4, y4, _) = coordinates3D		//The _ is special and simply means you’re ignoring this part for now.

/*Integer Overflow
Int8	:	-128		to 		128
UInt	:	0 			to 		255
Int16	:	-32768		to		32767
UInt16	:	0			to		655535
Int32	:	-2147483648	to		2147483647
UInt32
Int64
UInt64
*/

//Type aliases (typedef in c++)
typealias Animal = String
let myPet: Animal = "Puppy"
print("My dog's name is: \(myPet)")

typealias Coordinates = (Int, Int)
let xyCoordinates : Coordinates = (2, 4)
print("X:\(xyCoordinates.0) and Y: \(xyCoordinates.1)")

//Difference of Double and Float:
print("Double Pi: \(Double.pi)\t Float Pi:\(Float.pi)")

print("---------------------------\n")


//Comparison Operators:
let yes: Bool = true
let no: Bool = true
if(yes){
	print("Yey thats \(yes)")
}
//and ofc you can use w/o type identifier
let yes2 = true
let no2 = false
if(!no2){
	print("Ofc this is \(no2)")
}

//boolean operators:
let doesOneEqualsTwo = (1 == 2)
let doesOneNotEqualsTwo = (1 != 2)
print(doesOneEqualsTwo)
print(doesOneNotEqualsTwo)

let isOneGreaterThanTwo = (1 > 2)
let isOneLessThanTwo = (1 < 2)
print("isOneGreaterThanTwo: \(isOneGreaterThanTwo)")
print("isOneLessThanTwo: \(isOneLessThanTwo)")

//String equality:
let guess = "dog"
let dogEqualsCat = (guess == "cat")
print("is dog equals cat: \(dogEqualsCat)")

//toggling a bool:
var switchState: Bool = true
switchState.toggle() // => false
switchState.toggle() // => true
print(switchState)

//if statement
if(2>1){
	print("Yes 2>1")
}

let userName = "Yusuf"
if(2>1 && userName == "Yusuf"){
	print("Yey!")
}
if(2<1 || userName == "Nali"){
	print("Yey!")
}
else{
	print("Boo!")
}

//Encapsulating variables: hoursOver40 and priceBegin are encapsulated vars. They live in if statement.
var hoursWorkedNew = 45
var priceBegin = 0
if(hoursWorkedNew>40){
	let hoursOver40 = hoursWorkedNew-40;
	priceBegin += hoursOver40*50
	hoursWorkedNew -= hoursOver40
}
priceBegin += hoursWorkedNew*25
print(priceBegin)

//Ternary operator works here to:
//(<CONDITION>) ? <TRUE VALUE> : <FALSE VALUE>
let aX = 5
let bY = 10
let myMin = aX<bY ? aX : bY
let myMax = aX>bY ? aX : bY
print(myMin)
print(myMax)


//While Loops
//Infinite Loop
/*
while true { //do something }
*/

var sumOf = 1
while sumOf < 1000{
	sumOf = sumOf + (sumOf + 1);
}
print(sumOf)

//Repeat-While Loops (same as do-while)
sumOf = 1
repeat {
	sumOf = sumOf + (sumOf + 1)
}while sumOf<500
print(sumOf)

let closedRange = 0...5		//[0,5]
let halfOpenRange = 0..<5	//[0,5)
while Int.random(in: 1...6) != 6 {
	print("It's absolutely not a six")
}

//For loops
/*
for <CONSTANT> in <COUNTABLE RANGE> {
	<LOOP CODE>
}
*/
let countToTen = 10
var sumToTen = 0
for i in 1...countToTen{
	sumToTen += i
}
print(sumToTen)

let hourOfDay = 12
var timeOfDay = ""
switch hourOfDay {
	case 0...5:
		timeOfDay = "Early morning"
	case 6...11:
		timeOfDay = "Morning"
	case 12...16:
		timeOfDay = "Afternoon"
	case 17...19:
		timeOfDay = "Evening"
	case 20..<24:
		timeOfDay = "Late evening"
	default:
		timeOfDay = "INVALID HOUR!"
}
print(timeOfDay)

var evenOrOdd: Int  = 50
switch (evenOrOdd) {
	case let x where x % 2 == 0:
		print("Even")
	default:
		print("Odd")
}

//switch partial matching
let coordinatesOfObject = (x: 3, y: 2, z: 5)
switch coordinatesOfObject {
	case (0, 0, 0): // 1
		print("Origin")
	case (_, 0, 0): // 2
		print("On the x-axis.")
	case (0, _, 0): // 3
		print("On the y-axis.")
	case (0, 0, _): // 4
		print("On the z-axis.")
	default: // 5
		print("Somewhere in space")
}
//////// */

/*
//////// DAY 2 ////////


//Functions
func printMyName(){
	print("Hello, Its Joseph.")
}
printMyName()

func printMultipleOfFive(value: Int) {
	print("\(value) * 5 =  \(value * 5)")
}
printMultipleOfFive(value: 5)


func printMultipleOf(multiplier: Int, anyValue: Int){
	print("\(multiplier) * \(anyValue) = \(multiplier * anyValue)")
}
printMultipleOf(multiplier: 5, anyValue: 4)

//You can make this even clearer by giving a parameter a different external name. For example, you can change the name of the andValue parameter:
//at bottom func: externalVal is external name, value is internal name of (val)
func printMultipleOf(multiplier: Int, externalVal value: Int) {
	print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(multiplier: 4, externalVal: 2)

//You could, if you so wished, take this even further and use _ for all parameters, like so:
func printMultipleOf(_ multiplier: Int, _ value: Int){
	print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, 3)

//return values of func:
func multiply(_ number: Int, by multiplier: Int) -> Int {
	return number * multiplier
}
let result = multiply(4, by: 4)
print("4 * 4 is \(result)")

//It’s also possible to return multiple values through the use of tuples:
//note also you can remove return and simplier the function (in a single statement function, if it had more lines of code in it. you cant remove return)
func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
	return (number * factor, number / factor)
}
let results = multiplyAndDivide(4, by: 2)
let product = results.product
let quotient = results.quotient
print("Tuple(4,2) product is: \(product) and quotient is: \(quotient)")

//Function parameters are constants by default, which means they can’t be modified
/*ERROR:
func incrementAndPrint(_ value: Int) {
	value += 1
	print(value)
}
The top function return ERROR: Left side of mutating operator isn't mutable: 'value' is a 'let' constant
*/

//An important point to note is that Swift copies the value before passing it to the
//function, a behavior known as pass-by-value.

func incrementAndPrint(_ value: inout Int) {
	value += 1
}
var value = 5
incrementAndPrint(&value)
print(value)

//Overloading:
/*
func printMultipleOf(multiplier: Int, andValue: Int)
func printMultipleOf(multiplier: Int, and value: Int)
func printMultipleOf(_ multiplier: Int, and value: Int)
func printMultipleOf(_ multiplier: Int, _ value: Int)
This is called overloading and lets you define similar functions using a single name.
IMPORTANT:
• A different number of parameters.
• Different parameter types.
• Different external parameter names, such as the case with printMultipleOf.
*/

//Example of overloading by return type:
func getValue() -> Int {
	return 31
}
func getValue() -> String {
	return "Matt Galloway"
}
let intVal: Int = getValue()
let strVal: String = getValue()
print("\(intVal) and \(strVal)")

func getFullName(_ firstName: String, _ lastName: String) -> String {
	let fullName: String = firstName + " " + lastName
	return fullName
}
print(getFullName("Yusuf", "Turan"))

//Function as variables:
func addTwoVar(_ a: Int, _ b: Int) -> Int {
	a + b
}
var mySpecialFunction = addTwoVar
print(mySpecialFunction(4, 2))

//function is of a function type that takes two Int parameters and returns an Int, declared like so: (Int, Int) -> Int.
func printResult(_ function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
	let result = function(a, b)
	print (result)
}
printResult(addTwoVar, 4, 2)

//Documentation Example:
/// Calculates the avarage of three values
/// - Parameters:
///   - a: The first value
///   - b: The second value
///   - c: The third value
/// - Returns: The avare of three values
func calculateAvarage(of a: Double, and b: Double, and c: Double) -> Double {
	let total = a + b + c
	let avarage = total / 3
	return avarage
}
print(calculateAvarage(of: 5, and: 5, and: 20))


// stride(from:to:by:) and stride(from:through:by:) functions let you loop much more flexibly.
// to -> 10, 14, 18				through: 10, 14, 18, 22
for index in stride(from: 10, to: 22, by: 4) {
	print (index)
}

//for decrement with a stride use by negative (ex: -0.1)
for index in stride(from: 10.0 , through: 9.0, by: -0.1){
	print(index)
}

//Challenge2: Is it prime?
func isNumberDivisible(_ number: Int, by divisor: Int) -> Bool {
	return number % divisor == 0
}
func isPrime(_ number: Int) -> Bool {
	if (number < 0) {
		return false
	}
	if (number <= 3) {
		return true
	}
	let root = Int(sqrt(Double(number)))
	for i in 2...root{
		if(isNumberDivisible(number, by: i)){
			return false
		}
	}
	return true
}
print(isPrime(6)) // false
print(isPrime(13)) // true
print(isPrime(8893)) // true

//Challenge3: Recursive -fibonacci example:
func fibonacci(_ number: Int) -> Int {
	if(number <= 1){
		return number
	}
	else{
		return fibonacci(number - 1) + fibonacci(number - 2)
	}
}
print(fibonacci(18)) // = 2584
print(fibonacci(10)) // = 55

/*
Optionals are Swift’s solution to the problem of representing both a value and the
absence of a value. An optional is allowed to hold either a value or nil.

You declare a variable of an optional type by using the following syntax:
var errorCode: Int?
*/
var myFavoriteSong: String?
print(myFavoriteSong as Any) // nil

var res: Int? = 30
print(res as Any) // Outputs: Optional(30)

/*
ERROR:
Value of optional type 'Int?' must be unwrapped to a value of type 'Int' :

print(res + 1)

It doesn’t work because you’re trying to add an integer to a box — not to the value
inside the box, but to the box itself. That doesn’t make sense.
*/
//Solution: Force unwrapping:
var authorName: String? = "Matty Galloway"
var authorAge: Int? = 30
var unwrappedAuthorName = authorName!
var unwrappedAuthorAge = authorAge!
print("The author is \(unwrappedAuthorName) and he is \(unwrappedAuthorAge) year old")

/*
The use of the word “force” and the exclamation mark ! probably conveys a sense of
danger to you, and it should.
*/

//Don't unwrap the box when it contains no value.
//When it needs, try like this:
authorName = nil
if authorName != nil {
	print("Author is \(authorName!)")
}
else {
	print("No author.")
}


authorName = "Yusuf Turan"
if let unwrappedAuthorName = authorName {
	print("Author is \(unwrappedAuthorName)")
}
else {
	print("No author.")
}

//Because naming things is so hard, it’s common practice to give the unwrapped
//constant the same name as the optional (thereby shadowing that optional):
if let authorName = authorName {
	print("Author is \(authorName)")
}
else {
	print("No author.")
}

//guard:
// -> Sometimes you want to check a condition and only continue executing a function if
//		the condition is true, such as when you use optionals.
//	The usual way to encapsulate this behavior is using an optional, which has a value if
//	the fetch succeeds, and nil otherwise.
func getMeaningOfLife() -> Int? {
	return nil
}
func printMeaningOfLife() {
	guard let name = getMeaningOfLife() else {
		print("The number is nil")
		return
	}

	print(name)
}
printMeaningOfLife()

//Guard Example2
func calculateNumberOfSides(shape: String) -> Int? {
	switch shape {
		case "Triangle":
			return 3
		case "Square":
			return 4
		case "Rectangle":
			return 4
		case "Pentagon":
			return 5
		case "Hexagon":
			return 6
		default:
			return nil
	}
}
/*
Bottom functions returns same output with different ways. Check guard and w/o guard types
*/
func maybePrintSides(shape: String) {
	let sides = calculateNumberOfSides(shape: shape)
	if let sides = sides {
		print("A \(shape) has \(sides) sides.")
	}
	else {
		print("I don’t know the number of sides for \(shape).")
	}
}
func maybePrintSidesGuarded(shape: String) {
	guard let sides = calculateNumberOfSides(shape: shape) else {
		print("I don’t know the number of sides for \(shape).")
		return
	}
	print("A \(shape) has \(sides) sides.")
}
maybePrintSides(shape: "Triangle")
maybePrintSidesGuarded(shape: "Quadriangle")

//Nil coalescing
// The nil coalescing happens on the second line, with the double question mark (??),
// known as the nil coalescing operator. This line means mustHaveResult will equal
// either the value inside optionalInt, or 0 if optionalInt contains nil
var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0
print(mustHaveResult)

//the previous code is equvalent to following
var optionalInt2: Int? = 10
var mustHaveResult2: Int
if let unwrapped = optionalInt2 {
	mustHaveResult2 = unwrapped
} else {
	mustHaveResult2 = 0
}
print(mustHaveResult2)

*/
/* ////////// DAY 2 - Collection Types //////////

*/
