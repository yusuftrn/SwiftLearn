//Chapter20: Pattern Matching

import Foundation

let coordinate = (x: 1, y: 0, z: 0)

if (coordinate.y == 0) && (coordinate.z == 0) {
	print("along the x axis.")
}
//this uses pattern matching
if case (_, 0, 0) = coordinate {
	print("along the x axis.")
}


//If and guard
func process(point: (x: Int, y: Int, z: Int)) -> String {
	if case (0, 0, 0) = point {
		return "at origin."
	}
	return "not at origin"
}
let point1 = (x: 0, y: 0, z: 0)
let point2 = (x: 1, y: 2, z: 0)
print(process(point: point1))
print(process(point: point2))

//process for guard achieves the same effect:
func processGuard(point: (x: Int, y: Int, z: Int)) -> String {
	guard case (0, 0, 0) = point else {
		return "not at origin"
	}
	return "at origin."
}
print(processGuard(point: point1))
print(processGuard(point: point2))

//for loop: Pattern matching

let groupSizes = [1, 5, 4, 2, 3, 6, 3, 1]
for case 1 in groupSizes {
	print ("Found an individual")
}

//wildcard pattern:
//if the pattern uses _ (underscore) -> that means it matches every value of an case. example:
if case (_, 0, 0) = coordinate {
	print("On the x axis.")
	//every value for x (_ underscored) is okey.
}

//value binding pattern:
//like wildcard pattern, but it uses a var / or let. for matching.
if case (let x, 0, 0) = coordinate {
	print("On the x asis at \(x).")
}
//also we can match more than 1 value:
if case (let x, let y, 0) = coordinate {
	print("On the x-y plane at (\(x), \(y)).")
}


//enum case pattern:
enum Direction {
	case north, south, east, west
}
let heading = Direction.north

if case .north = heading {
	print("Yo John Snow. Dont forget your jacket.")
}

enum Organism {
	case plant
	case animal (legs: Int)
}

let pet = Organism.animal(legs: 4)
switch pet {
case .animal(let legs):
	print("this mutant has \(legs) leg")
default:
	print("No way.")
}

let wtfIsThat = Organism.plant
switch wtfIsThat {
case .animal(let legs):
	print("this mutant has \(legs) leg")
default:
	print("No way.")
}


//Optional Pattern:
let names: [String?] = ["josh", nil, "Brother", "David", nil, nil, "Ahmad"]
for case let name? in names {
	print(name)//excludes nil optionals.
}

//Is-type casting pattern:
let response: [Any] = [15, "George", 2.0, true]
for e in response {
	switch e {
	case is String:
		print("i found a string: \(e)")
	default:
		print("and other shits: \(e)")
	}
}
print("______")

//As type-casting pattern:
for e in response {
	switch e {
	case let text as String:
		print("Found a string: \(text)")
	default:
		print("and other ones \(e)")
	}
}


//Qualify your data with "where"
for number in 1...9 {
	switch number {
	case let x where x % 2 == 0:
		print("even: \(x)")
	default:
		print("odd: \(number)") //cant use x cause its not in scope.!
	}
}


//Create Level system with Pattern Matching:
enum LevelStatus {
	case complete
	case inProgress(percent: Double)
	case notStarted
}

let levels: [LevelStatus] = [.complete, .inProgress(percent: 0.6), .notStarted]

for level in levels {
	switch level {
	case .inProgress(let percent) where percent > 0.8:
		print("almost")
	case .inProgress(let percent) where percent > 0.5:
		print("halfway")
	default:
		print("cmoon try harder. \(level)")
	}
}

//Check custom tuple with pattern matching:
let name = "Josh"
let age  = 28
if case ("Josh", 28) = (name, age) {
	print("damn youf ound")
}

//login check:
var uName: String?
var uPass: String?

uName = "Joseph"
uPass = "1234"

switch (uName, uPass) {
case let (user?, pass?):
	print("Success! U: \(user), P: \(pass)")
case let (user?, nil):
	print("Password is missing! U: \(user).")
case let (nil, pass?):
	print("Username is missing.! pass: \(pass)")
default:
	print("Just quit.")
}


//try fib with pattern match:
func fib(pos: Int) -> Int {
	switch pos {
	case let n where n <= 1:
		return 0
	case 2:
		return 1
	case let n:
		return  fib(pos: n-1) + fib(pos: n-2)
	}
}

print("Fib(15): \(fib(pos: 15))")


//Expression Pattern:
let match = (1...5 ~= 2)
print(match)

let notMatch = (1...5 ~= 6)
print(notMatch)

//also you can use:
if case 1...5 = 2 {
	print("in the range")
}

//Overloading ~=
let list = [0, 3, 2, 1, 4]
let integerData = 5
/*
Type of expression is ambiguous without more context
let isInArr = (list ~= integerData)
cant use like this.
*/

func ~=(pattern: [Int], val: Int) -> Bool {
	for i in pattern {
		if (i == val) {
			return true
		}
	}
	return false
}
let isInArr = list.contains(integerData)

