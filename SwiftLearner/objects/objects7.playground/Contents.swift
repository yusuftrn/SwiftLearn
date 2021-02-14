import Foundation

protocol Vehicle {
	func accelerate()
	func stop()
}
//protocol doesn’t contain any implementation. => like interface in oop

//a protocol can be adopted by a class, struct or enum (or another protocol)

class Unicycle: Vehicle {
	var peddling = false
	
	func accelerate() {
		peddling = true
	}
	
	func stop() {
		peddling = false
	}

}

var cylce = Unicycle()
print(cylce.peddling)
cylce.accelerate()
print(cylce.peddling)

//Methods in protocols:
//You define methods on protocols much like you would on any class, struct or enum with parameters and return values:

enum Direction {
	case left
	case right
}

protocol DirectionalVehicle {
	func accelerate()
	func stop()
	func turn(_ direction: Direction)
	func description() -> String
}

/*
Also, methods defined in protocols can’t contain default parameters:
protocol OptionalDirectionVehicle {
	// Build error!
	func turn(_ direction: Direction = .left)
}
*/

//To provide direction as an optional argument, you’d define both versions of the method explicitly:
protocol OptionalDirectionVehicle {
	func turn()
	func turn(_ direction: Direction)
}

//You can also define properties in a protocol:
protocol VehicleProperties {
	var weight: Int { get }
	var name: String { get set }
}

//Initializers in protocols:
//While protocols themselves can’t be initialized, they can declare initializers that conforming types should have:

protocol Account {
	var value: Double { get set }
	init(initialAmount: Double)
	init?(transferAccount: Account)
}
//In the Account protocol above, you define two initializers as part of the protocol.
// So if a class uses this protocol. It's requires this initializers:

class BitcoinAccount: Account {
	var value: Double
	
	required init(initialAmount: Double) {
		value = initialAmount
	}
	
	required init?(transferAccount: Account) {
		guard (transferAccount.value > 0.0) else {
			return nil
		}
		value = transferAccount.value
	}
}

let accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 60.00)
let transferAccount = accountType.init(transferAccount: account)!
print (transferAccount.value)

protocol Area {
	var area: Double { get }
}

struct Square: Area {
	let side: Double
	
	var area: Double {
		side * side
	}
}

struct Triange: Area {
	let base: Double
	let height: Double
	
	var area: Double {
		0.5 * base * height
	}
}

struct Circle: Area {
	let radius: Double
	
	var area: Double {
		.pi * radius * radius
	}
}

let sq = Square(side: 4)
let tri = Triange(base: 3, height: 4)
let cir = Circle(radius: 3)

let shapes: [Area] = [sq, tri, cir]
print( shapes.map { $0.area })


//Implementing Protocols: when you declare your type as conforming to a protocol, you
//must implement all the requirements declared in the protocol:
//If Bike class implements Vehicle protocol -> it must implement all requirements declared in protocol.

//Implementing properties:
/*
Recall that properties in protocols come with a get and possibly a set requirement
and that a conforming type must conform to at least these requirements.
Upgrade Bike to a WheeledVehicle:
*/

protocol WheeledVehicle: Vehicle {
	var numberOfWheels: Int { get }
	var wheelSize: Double { get set }
}

class Bike: WheeledVehicle {
	let numberOfWheels = 2
	var wheelSize = 16.0
	
	var peddling = false
	var breakesAppllied = false
	
	func accelerate() {
		peddling = true
		breakesAppllied = false
	}
	
	func stop() {
		peddling = false
		breakesAppllied = true
	}
}

/*
The numberOfWheels constant fulfills the get requirement.
The wheelSize variable fulfills both get and set requirements.

Protocols don’t care how you implement their requirements, as long as you
implement them. You can choose:
• A constant stored property.
• A variable stored property.
• A read-only computed property.
• A read-write computed property.
*/


//Associated types in protocols:
protocol WeightCalculatable {
	associatedtype WeightType
	var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
	//This heavy thing only needs Integer accuracy
	typealias WeightType = Int
	
	var weight: Int { 100 }
}

class LightThing: WeightCalculatable {
	//This light thing only needs Decimal places
	typealias WeightType = Double
	
	var weight: Double { 0.0025 }
}
/* Build error! protocol 'WeightCalculatable' can only be used as a generic
// constraint because it has Self or associated type requirements.
// let weightedThing: WeightCalculatable = LightThing() */


//You can also adopt protocols using extensions:
protocol Reflective {
	var typeName: String { get }
}

extension String: Reflective {
	var typeName: String {
		"I am a String"
	}
}
let title = "Swift Apprentice!"
print(title.typeName)

//The following code breaks out the adoption of Vehicle into an extension on AnotherBike:
protocol Wheeled {
	var numberOfWheels: Int { get }
	var wheelSize: Double { get set }
}

class AnotherBike: Wheeled {
	var peddling = false
	let numberOfWheels = 2
	var wheelSize = 16.0
}
extension AnotherBike: Vehicle {
	func accelerate() {
		peddling = true
	}
	
	func stop() {
		peddling = false
	}
}
//! You can’t declare stored properties in extensions


//Requiring reference semantics:
protocol Named {
	var name: String { get set }
}

class ClassyName: Named {
	var name: String
	init(name: String) {
		self.name = name
	}
}

struct StructyName: Named {
	var name: String
}

//lets try refence type: class
var named: Named = ClassyName(name: "Classy")
var copy = named
named.name = "Still Classy"
print(named.name) //Still Classy
print(copy.name) //Still Classy

//and property(value) type: struct
named = StructyName(name: "Structy")
copy = named
named.name = "Still Structy?"
print(named.name) //Still Structy?
print(copy.name) //Structy


/**!!!
If you’re designing a protocol to be adopted exclusively by classes,
it’s best to request that Swift uses reference semantics when using this protocol as a type.
*/
protocol NamedForClass: class {
	var name: String { get set }
}
class ClassNamed: NamedForClass {
	var name: String
	init(name: String) {
		self.name = name
	}
}
var namedo: ClassNamed = ClassNamed(name: "Class Namedo")
var copyIt = namedo
namedo.name = "Changed: Class Namedo"
print(namedo.name) //Still Classy
print(copyIt.name) //Still Classy

/*ERRROR: It' cant used by struct
struct StructNamed: NamedForClass {
	var name: String
}
*/


//Protocols in the Standard Library
let swiftA = "Swift"
let swiftB = "Swift"
swiftA == swiftB // true

//Equatable: but you can't use it with any object:
class Record {
	var wins: Int
	var losses: Int
	init(wins: Int, losses: Int) {
		self.wins = wins
		self.losses = losses
	}
}
let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)
// recordA == recordB // Build error!

//lets apply equtable protocol to records like so:
extension Record: Equatable {
	static func ==(lhs: Record, rhs: Record) -> Bool {
		return (lhs.wins == rhs.wins) && (lhs.losses == rhs.losses)
	}
}
print( recordA ==  recordB )

extension Record: Comparable {
	static func <(lhs: Record, rhs: Record) -> Bool {
		if lhs.wins == rhs.wins {
			return lhs.losses > rhs.losses
		}
		return lhs.wins < rhs.wins
	}
}


//Comparable:
struct Artist: Comparable {
	var name: String
	
	static func <(lhs: Artist, rhs: Artist) -> Bool {
		return lhs.name < rhs.name
	}
}
let taylor = Artist(name: "Taylor Swift")
let justin = Artist(name: "Justin Bieber")
print(taylor < justin)


//"Free" Functions:
let teamA = Record(wins: 14, losses: 11)
let teamB = Record(wins: 23, losses: 8)
let teamC = Record(wins: 23, losses: 9)
var leagueRecords = [teamA, teamB, teamC]
leagueRecords.sort()

// {wins 14, losses 11}
// {wins 23, losses 9}
// {wins 23, losses 8}

leagueRecords.max()
leagueRecords.min()
leagueRecords.starts(with: [teamA, teamC])
leagueRecords.contains(teamA)

//Hashtable: For value types(structs, enums) the compiler will generate Equatable and Hashtable conformance automatically.
//but in reference types(classes) you have to do it yourself.
//Example:
class StudentHash {
	let email: String
	let firstName: String
	let lastName: String
	
	init(email: String, firstName: String, lastName:String) {
		self.email = email
		self.firstName = firstName
		self.lastName = lastName
	}
}
extension StudentHash: Hashable {
	static func ==(lhs: StudentHash, rhs: StudentHash) -> Bool {
		return (lhs.email == rhs.email && lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName)
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(email)
		hasher.combine(firstName)
		hasher.combine(lastName)
	}
}

let joshua = StudentHash(email: "jo@nomail.com", firstName: "Joshua", lastName: "LastMohikan")
//push data to dictionary.
let lockerMap = [joshua: "1A"]



//CustomStringConvertible:
//the very handy CustomStringConvertible protocol helps to log and debug instances:
//when we use

print(joshua)//Outputs: __lldb_expr_17.StudentHash

//By adopting CustomStringConvertible to our class:
extension StudentHash: CustomStringConvertible {
	var description: String {
		"\(firstName) - \(lastName)"
	}
}
print(joshua) //Joshua - LastMohikan
