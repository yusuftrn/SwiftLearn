//Custom operators, Subscripts & Keypaths

import Foundation

//Create your own operator (overloading)
infix operator **

func **(base: Int, pow: Int) -> Int {
	precondition(pow >= 2)
	var res = base
	for _ in 2...pow {
		res *= base
	}
	return res
}
let power4up5 = 4 ** 5
print(power4up5)

//Example: Implement a custom multiplication operator for strings so that the following code works:
infix operator ***
func ***(base: String, count: Int) -> String {
	guard count > 0 else {
		return ""
	}
	guard count > 1 else {
		return base
	}
	
	var res = base
	for _ in 2...count {
		res += base
	}
	return res
}
let baseString = "abc"
let times = 5
var multipliedString = baseString *** times
print(multipliedString)

//Generic Operators:
func **<T: BinaryInteger>(base: T, power: Int) -> T {
	precondition(power >= 2)
	var res = base
	for _ in 2...power {
		res *= base
	}
	return res
}

let exponent = 4
let unsignedBase: UInt = 2
let unsignedResult = unsignedBase ** exponent
let base8: Int8 = 2
let result8 = base8 ** exponent

//Subscripts:
class Person {
	let name: String
	let age: Int
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}
let me = Person(name: "Cosmin", age: 33)

extension Person {
	subscript(key: String) -> String? {
		switch key {
		case "name":
			return name
		case "age":
			return "\(age)"
		default:
			return nil
		}
	}
}
print(me["name"] as Any)
print(me["age"] as Any)
print(me["gender"] as Any)

//Subscript with parameters
class PersonData {
	let name: String
	let age: Int
	init(name: String, age: Int) {
		self.name = name
		self.age = age
	}
}
let myData = PersonData(name: "Joseph", age: 33)

extension PersonData {
	subscript(property key: String) -> String? {
		switch key {
		case "name":
			return name
		case "age":
			return "\(age)"
		default:
			return nil
		}
	}
}
print(myData[property: "name"] as Any)
print(myData[property: "age"] as Any)
print(myData[property: "gender"] as Any)

//Static subscripts:
/*
1. Use static to create a static subscript that returns the default or custom path for File.
2. Call the subscript on File instead of a File instance.
*/
class File {
	let name: String
	init(name: String) {
		self.name = name
	}
	//define subscript
	static subscript(key: String) -> String {
		switch key {
			case "path":
				return "custom path"
			default:
				return "default path"
		}
	}
}
//use it:
print( File["path"] )
print( File["PATH"] )

//Dynamic member lookup:
@dynamicMemberLookup
class Instrument {
	let brand: String
	let year: Int
	private let details: [String: String]
	
	init(brand: String, year: Int, details: [String: String]) {
		self.brand = brand
		self.year = year
		self.details = details
	}
	
	subscript(dynamicMember key: String) -> String {
		switch key {
		case "info":
			return "\(brand) made in \(year)"
		default:
			return details[key] ?? ""
		}
	}
}
let instrument  = Instrument(brand: "Roland", year: 2019, details: ["type" : "acoustic", "pitch" : "C"])
print (instrument.info)
print (instrument.type)
print (instrument.pitch)

class Guitar: Instrument {}
let guitar = Guitar(brand: "Fender", year: 2019, details: ["type": "electric", "pitch": "C"])
print (guitar.info)


//Keypaths: enable you to store references to properties.
class Tutorial {
	let title: String
	let author: Person
	let details: (type: String, category: String)
	init(title: String, author: Person,
		 details: (type: String, category: String)) {
		self.title = title
		self.author = author
		self.details = details
	}
}
let tutorial = Tutorial(title: "Object Oriented Programming in Swift",
	author: me,
	details: (type: "Swift",
			  category: "iOS"))

let type = \Tutorial.details.type
let tutorialType = tutorial[keyPath: type]
let category = \Tutorial.details.category
let tutorialCategory = tutorial[keyPath: category]


//Setting properties: Keypaths can change property values.
class JukeBox {
	var song: String
	
	init(song: String) {
		self.song = song
	}
}
let jukebox = JukeBox(song: "Nothing Else Matters")

let song = \JukeBox.song
jukebox[keyPath: song] = "Stairway to Heaven"
print(jukebox[keyPath: song])


//Keypath member lookup: we can use dynamic member lookup for keypaths:

struct Point {
	let x, y: Int
}

@dynamicMemberLookup
struct Circle {
	let center: Point
	let radius: Int
	
	subscript(dynamicMember keyPath: KeyPath<Point, Int>) -> Int {
		center[keyPath: keyPath]
	}
}
let center = Point(x: 1, y: 2)
let circle = Circle(center: center, radius: 1)
print(circle.x)
print(circle.y)
print(circle.radius)
