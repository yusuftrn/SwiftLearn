//Chapter 19 Challenges:

import Foundation

//1: Make it compile

extension Array {
	subscript(index index: Int) -> (String, String)? {
		guard let value = self[index] as? Int else {
			return nil
		}
		switch (value >= 0, abs(value) % 2) {
		case (true, 0):
			return ("positive", "even")
		case (true, 1):
			return ("positive", "odd")
		case (false, 0):
			return ("negative", "even")
		case (false, 1):
			return ("negative", "odd")
		default:
			return nil
		}
	}
}
let numbers = [-2, -1, 0, 1, 2]
numbers[index: 0]
numbers[index: 1]
numbers[index: 2]
numbers[index: 3]
numbers[index: 4]

//Challenge 2: Random access string
extension String {
	subscript(index index: Int) -> Character? {
		guard (0..<count).contains(index) else {
			return nil
		}
		return self[self.index(startIndex, offsetBy: index)]
	}
}
let myData = "Josephan"
print (myData[index: 5]!)

//Challenge 3: Generic exponentiation:
infix operator **
func **<T: FloatingPoint>(base: T, power: Int) -> T {
	precondition(power >= 2)
	var res = base
	for _ in 2...power {
		res *= base
	}
	return res
}
let exponent = 2
let baseDouble = 2.0
var resultDouble = baseDouble ** exponent
let baseFloat: Float = 2.0
var resultFloat = baseFloat ** exponent
let baseCG: CGFloat = 2.0
var resultCG = baseCG ** exponent
