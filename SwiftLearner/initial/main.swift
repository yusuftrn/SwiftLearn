//
//  main.swift
//  SwiftLearner
//
//  Created by Yusuf Turan on 3.02.2021.
//

import Foundation

/*
2+6		// OK
2 + 6	// OK
2 +6	// ERROR
2+ 6	// ERROR
*/

print (22/7) //Output:3
print(22.0/7.0)//Output: 3.142857142857143 //Use decimals when you need!

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
