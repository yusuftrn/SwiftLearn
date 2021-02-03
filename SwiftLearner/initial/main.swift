//
//  main.swift
//  SwiftLearner
//
//  Created by Yusuf Turan on 3.02.2021.
//

import Foundation

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
