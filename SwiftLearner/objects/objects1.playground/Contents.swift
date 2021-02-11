//
//  object.swift
//  SwiftLearner
//
//  Created by Yusuf Turan on 6.02.2021.
//

import Foundation

let restaurantLocation = (2, 4)
let restaurantRange = 2.5

let otherRestaurantLocation = (7, 8)
let otherRestaurantRange = 1.5

func distance(from source: (x: Int, y: Int), to target: (x: Int, y: Int)) -> Double{
	let distanceX = Double(source.x - target.x)
	let distanceY = Double(source.y - target.y)
	return (distanceX*distanceX + distanceY*distanceY).squareRoot()
}

//If we have only one restaurant we have one delivery location
func isDeliveryRange(location: (x: Int, y: Int)) -> Bool{
	let deliveryDistance = distance(from: location, to: restaurantLocation)
	return deliveryDistance < restaurantRange
}
print("Restaurant1: Send pizza to: (7, 8)?")
print("\(isDeliveryRange(location: (7, 8)))")
print("Restaurant1: Send pizza to: (1, 2)?")
print("\(isDeliveryRange(location: (1, 2)))")

//we have two delivery location
func isInDeliveryRange(location: (x: Int, y: Int)) -> Bool{
	let deliveryDistance = distance(from: location, to: restaurantLocation)
	let secondDeliveryDistance = distance(from: location, to: otherRestaurantLocation)
	return deliveryDistance < restaurantRange || secondDeliveryDistance < otherRestaurantRange
}

print("Restaurant1 or Restaurant2: Send pizza to: (7, 8)?")
print("\(isInDeliveryRange(location: (7, 8)))")
print("Restaurant1 or Restaurant2: Send pizza to: (1, 2)?")
print("\(isInDeliveryRange(location: (1, 2)))")


//Structs
struct Location	{
	let x: Int
	let y: Int
}
struct DeliveryArea	{
	let center: Location
	var radius: Double
}
var storeLocation = Location(x: 5, y: 5)
var storeArea = DeliveryArea(center: storeLocation, radius: 4)
print(storeLocation)
print(storeArea)

struct PizzaChoice {
	let topping: Bool
	let size: String
	let notes: String
}
//Accessing struct members
var yusufsPizzaOrder = PizzaChoice(topping: false, size: "Medium", notes: "Please send me quickly")
print(yusufsPizzaOrder.notes)
print(storeArea.radius) //4.0

//we can access and modify struct details directly
storeArea.radius = 20
print(storeArea.radius) //20.0

let areas = [
	DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5),
	DeliveryArea(center: Location(x: 9, y: 7), radius: 4.5)
]

//Struct based modification of the deliveryrange calculation
func isInDeliveryRange(_ location: Location) -> Bool{
	for area in areas{
		let distanceToStore = distance(from: (area.center.x, area.center.y), to: (location.x, location.y))
		if(distanceToStore < area.radius){
			return true
		}
	}
	return false
}

let customerLocation1 = Location(x: 8, y: 1)
let customerLocation2 = Location(x: 5, y: 5)

print(isInDeliveryRange(customerLocation1)) //false
print(isInDeliveryRange(customerLocation2)) //true


//also we can add functions in structs
struct NewDeliveryArea	{
	let center: Location
	var radius: Double
	
	func contains(_ location: Location) -> Bool{
		let distanceFromCenter = distance(from: (center.x, center.y), to: (location.x, location.y))
		return distanceFromCenter  < radius
	}
}

let myArea = NewDeliveryArea(center: Location(x: 5, y: 5), radius: 4.5)
let customerLocation = Location(x: 2, y: 2)
print( myArea.contains(customerLocation) ) //true


//Structures as values
var a = 5
var b = a
print(a) // 5
print(b) // 5

a = 10
print(a) // 10
print(b) // 5

//how about structures:
var area1 = DeliveryArea(center: Location(x: 2, y: 4), radius: 2.5)
var area2 = area1
print(area1.radius) //2.5
print(area2.radius) //2.5

area1.radius = 4
print(area1.radius) //4.0
print(area2.radius) //2.5

struct TShirt{
	let size: String
	let color: String
	let material: String
	var cost: Int
	
	mutating func calculateCost() -> Int {
		cost = 0
		if(size == "Medium"){
			cost += 100
		}
		if(size == "Large"){
			cost += 150
		}
		if(material == "Cotton"){
			cost += 150
		}
		if(material == "Polyester"){
			cost += 100
		}
		return cost
	}
}

var myTshirt = TShirt(size: "Medium", color: "Red", material: "Cotton", cost: 0)
print(myTshirt.calculateCost())


//stored properties
struct Contact {
	var fullName: String
	var emailAddress: String
}
var person1 = Contact(fullName: "Yusuf Turan", emailAddress: "joseph@nomail.com")

//access with dot (.) notation:
let name = person1.fullName
let email = person1.emailAddress

//If you’d like to prevent a value from changing, you can define a property as a
//constant using let, like so:
struct ConstatContact {
	let fullName: String
	let emailAddress: String
}
var person2 = ConstatContact(fullName: "Grace Hopper", emailAddress: "grace@nomail.com")
//ERROR: person2.emailAddress = "grace@gmail.com" //cannont assign to property: 'emailAddress' is a 'let' constant.

//Default values
struct ContactWithDefault {
	var fullName: String
	let emailAddress: String
	var relationship: String = "Friend"
}
var person3 = ContactWithDefault(fullName: "Yusuf Turan", emailAddress: "yusuf@nomail.com")
print(person3.relationship) //Friend

//you can specify default values when initialization or after.
var boss = ContactWithDefault(fullName: "Ray Wenderlich", emailAddress: "ray@raywenderlich.com", relationship: "Boss")
print(boss.relationship)


//Computed properties
struct Persona {
	var age: Int
	var ageInDogYears: Int {
		get {
			return age * 7
		}
	}
}

var fan = Persona(age: 25)
print("Dog year: \(fan.ageInDogYears)")

struct TV {
	var height: Double
	var width: Double
	var diagonal: Int {
		let result = (height * height + width * width).squareRoot().rounded()
		return Int(result)
	}
}
var myScreen = TV(height: 1080, width: 1920)
print(myScreen.diagonal) //2203


//Getter and Setter
struct TimeCalculator {
	var seconds: Double = 0
	
	init(seconds: Double) {
		self.seconds = seconds
	}
	
	var minutes: Double {
		get {
			return (seconds / 60)
		}
		set {
			self.seconds = (newValue * 60)
		}
	}
	
	var hours: Double {
		get {
			return (seconds / (60 * 60))
		}
		set {
			self.seconds = (newValue * (60 * 60))
		}
	}
	
	var days: Double {
		get {
			return (seconds / (60 * 60 * 24))
		}
		set {
			self.seconds = (newValue * (60 * 60 * 24))
		}
	}
}

var currentTime = TimeCalculator(seconds: 86400)
print(currentTime.days)		// 1 day
print(currentTime.hours)	// 24 hour
print(currentTime.minutes)	// 1440 minutes
print(currentTime.seconds)  // 86400 seconds


//Type properties: (static)
//You can use a type property to store the game’s progress as the player unlocks each
//level. A type property is declared with the modifier static:
struct Level {
	static var highestLevel: Int = 1
	let id: Int
	var boss: String
	var unlocked: Bool
}
let level1 = Level(id: 1, boss: "Chameleon", unlocked: true)
let level2 = Level(id: 2, boss: "Squid", unlocked: false)
let level3 = Level(id: 3, boss: "Chupacabra", unlocked: false)
let level4 = Level(id: 4, boss: "Yeti", unlocked: false)

//*ERROR:
// let highestLevel = level3.highestLevel
// Error: you can’t access a type property on an instance

let highestLevel = Level.highestLevel
print(highestLevel) //1 -> Instead, you access it on the type itself



//Property observers
//Example: For your Level implementation, it would be useful to automatically set the
//highestLevel when the player unlocks a new one. For that, you’ll need a way to
//listen to property changes. Thankfully, there are a couple of property observers that
//get called before and after property changes.
// => willSet and didSet observers are only available for stored properties.
// willset: Değer kaydedilmeden hemen önce çalışırlar.
// didset: 	Yeni değer kaydedildikten hemen sonra çalışırlar.

struct StepCounter {
	var totalStep: Int = 0{
		willSet(newTotalStep){
			print("Total step count will be: \(newTotalStep)")
		}
		didSet {
			if totalStep > oldValue {
				print("Added step count is: \(totalStep - oldValue)")
			}
		}
	}
}
var stepCounter = StepCounter()
stepCounter.totalStep = 100
//Total step count will be: 100
//Added step count is: 100
print(stepCounter.totalStep) //OUTPUT: 100

stepCounter.totalStep = 152
//Total step count will be: 152
//Added step count is: 52
print(stepCounter.totalStep) //OUTPUT: 152

struct NewLevelSystem {
	static var highestLevel = 1
	let id: Int
	var boss: String
	var unlocked: Bool {
		didSet {
			if unlocked && id > Self.highestLevel {
				Self.highestLevel = id
			}
		}
	}
}
//Now, when the player unlocks a new level, it will update the highestLevel type
//property if the level is a new high.


//Limiting a variable
// you can also use property observers to limit the value of variable
struct LightBulb {
	static let maxCurrent = 40
	var currentPower = 0 {
		didSet {
			if (currentPower > Self.maxCurrent) {
				print("""
					Current is too high,
					falling back to previous setting
				""")
				currentPower = oldValue
			}
		}
	}
}

var blueLight = LightBulb()
blueLight.currentPower = 20
print("Light's current power is: \(blueLight.currentPower)") //20
blueLight.currentPower = 50 //Outputs the above error message and set the oldvalue
print("Light's current power is: \(blueLight.currentPower)") //20


//Lazy properties
//If you have a property that might take some time to calculate, you don’t want to slow
//things down until you actually need the property
// -> Lazy variable is must be var. (you cant use let)
struct Circle {
	lazy var pi = {
		((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
	}()
	var radius = 0.0
	var cicumference: Double {
		mutating get {
			pi * radius * 2
		}
	}
	init(radius: Double) {
		self.radius = radius
	}
}
var myCircle = Circle(radius: 5) // got a circle, pi has not been run
let circumference = myCircle.cicumference //31.42  -> also, pi now has a value
print("Circumference is : \(circumference)")

struct IceCream {
	var name = "Simple"
	lazy var ingredients: [String] = {
		["sugar", "milk", "cream", "vanilla"]
	}()
}
var iceCream = IceCream()
iceCream.ingredients.append("strawberries")
iceCream.name = "Strawberry"
print(iceCream.ingredients) //lazily initialized
print(iceCream.name)


struct FuelTank {
	var lowFuel: Bool
	var level: Double {
		didSet {
			if level < 0 {
				level = 0
			}
			if level > 1 {
				level = 1
			}
			lowFuel = level < 0.1
		}
	}
}
struct CarClass {
	let make: String
	let color: String
	var tank:  FuelTank
}
var myCar = CarClass(make: "BMW", color: "Red", tank: FuelTank(lowFuel: false, level: 1))
myCar.tank.level = -1
print(myCar.tank) //FuelTank(lowFuel: true, level: 0.0)
myCar.tank.level = 1
print(myCar.tank) //FuelTank(lowFuel: false, level: 1.0)


//Turning a function into a method:
let months = ["January", "February", "March", "April", "May", "June",
			  "July", "August", "September", "October", "November", "December"]

struct SimpleDate {
	var month: String
	
	func monthsUntilWinterBreak(from date: SimpleDate) -> Int {
		return months.firstIndex(of: "December")! - months.firstIndex(of: date.month)!
	}
	//Using self
	func monthsUntilWinterBreak() -> Int {
		return months.firstIndex(of: "December")! - months.firstIndex(of: self.month)!
	}
}

let myDate = SimpleDate(month: "April")
print(myDate.monthsUntilWinterBreak(from: myDate)) //8
print(myDate.monthsUntilWinterBreak()) //Uses self -> //8


//Initializers:
/*
The example of SimpleDate struct you have to initialize with:
let date = SimpleDate(month: "January")
So how we initialize with:
let date = SimpleDate() // Error!
*/
struct SimpleDateWithInit {
	var month: String
	
	init() {
		month = "January"
	}
	
	func monthUntilWinterBreak() -> Int {
		return months.firstIndex(of: "December")! - months.firstIndex(of: month)!//you can use self.variable or just variable
	}
}
let date2: SimpleDateWithInit = SimpleDateWithInit()
print(date2.month) //January
print(date2.monthUntilWinterBreak()) //11

//Default values and Initializers:
struct DefaultValuesExample{
	let x: Int = 5
	let y: Int = 10
	
	func calculateInside() -> Int {
		let total = self.x + self.y
		return total
	}
}
let addThem = DefaultValuesExample()
print("\(addThem.x) + \(addThem.y) = \(addThem.calculateInside()) ")


//Mutating methods:
/*
Methods in structures cannot change the values of the instance without being marked as mutating.
The mutating keyword marks a method that changes a structure’s value.
Since a structure is a value type, the system copies it each time it’s passed around an app.
*/
struct Stack {
	public private(set) var items = [Int]() //empty items array
	
	mutating func push(_ item: Int) {
		items.append(item)
	}
	
	mutating func pop() -> Int? {
		if !items.isEmpty {
			return items.removeLast()
		}
		return nil
	}
	
	mutating func isEmpty() -> Bool {
		if !items.isEmpty{
			return false
		}
		return true
	}
}

var myStack = Stack()
print("\(myStack) & is empty? \(myStack.isEmpty())")
myStack.push(4)
myStack.push(42)
print("\(myStack) & is empty? \(myStack.isEmpty())")
print(myStack.pop()!)

//Type Methods:
//Type methods are useful for things that are about a type in general, rather than something about specific instances.

struct Math {
	static func factorial(of number: Int) -> Int {
		return (1...number).reduce(1, *)
	}
	
	static func triangleNumber(of number: Int) -> Int{
		return (1...number).reduce(0, +)
	}
}
print(Math.factorial(of: 6)) //120
print(Math.triangleNumber(of: 6)) //21


//Adding to an existing structure with extensions
extension Math {
	static func primeFactors(of value: Int) -> [Int] {
		var remainingValue = value
		var testFactor = 2
		var primes = Array<Int>()
		while (testFactor * testFactor <= remainingValue) {
			if remainingValue % testFactor == 0 {
				primes.append(testFactor)
				remainingValue /= testFactor
			}
			else {
				testFactor += 1
			}
		}
		if (remainingValue > 1) {
			primes.append(remainingValue)
		}
		return primes
	}
}
print(Math.primeFactors(of: 81))

//Keeping the compiler-generated initializer using extensions
struct NewSimpleDate {
	var month = "January"
	var day = 1
	
	func monthsUntilWinterBreak() -> Int {
		return months.firstIndex(of: "December")! - months.firstIndex(of: month)!
	}
	
	mutating func advance() {
		day += 1
	}
}
extension NewSimpleDate {
	init(month: Int, day: Int){
		self.month = months[month-1]
		self.day = day
	}
}
var todayIs = NewSimpleDate();
print(todayIs)
var todayData = NewSimpleDate(month: 5, day: 24)
print("\(todayData) and monthsUntilWinterBreak: \(todayData.monthsUntilWinterBreak())")

//Challenge1: Grow a Circle
struct CircleNew {
	var radius = 0.0
	var area: Double {
		get {
			.pi * radius * radius
		}
		set {
			radius = (newValue / .pi).squareRoot()
		}
	}
	mutating func grow(_ factor: Double){
		area *= factor
	}
	init(radius: Double){
		self.radius = radius
	}
}
var circeq = CircleNew(radius: 5)
print(circeq.area)
circeq.grow(3)
print(circeq.area)


//Challenge2: Advanced Date
struct AdvancedDate {
	var month: String
	var day: Int
	
	var totalDaysInMonth: Int {
		switch month {
		case "January", "March", "May", "July", "August", "October", "December":
			return 31
		case "April", "June", "September", "November":
			return 30
		case "February":
			return 28
		default:
			return 0
		}
	}
	
	mutating func advance() {
		if (day == totalDaysInMonth) {
			if (month == "December") {
				month = "January"
			} else {
				month = months[months.firstIndex(of: month)!.advanced(by: 1)]
			}
			day = 1
		} else {
			day += 1
		}
	}
}
var dateQ = AdvancedDate(month: "December", day: 31)
dateQ.advance()
print(dateQ.month)
print(dateQ.day)

//Challenge3: Odd and Even Math extension
extension Math {
	static func isEven(_ val: Int) -> Bool {
		return  val % 2 == 0
	}
	static func isOdd(_ val: Int) -> Bool {
		return (val+1) % 2 == 0
	}
}
print(Math.isOdd(30))
print(Math.isEven(42))
print(Math.isOdd(31))
print(Math.isEven(43))

//Challenge 4: Odd and Even Int
extension Int {
	var isEven: Bool {
		self % 2 == 0
	}
	var isOdd: Bool {
		(self+1) % 2 == 0
	}
}
print(30.isOdd)
print(42.isEven)
print(31.isOdd)
print(43.isEven)

//Challenge 5: Prime Factors
extension Int {
	func primeFactors() -> [Int] {
		var remainingValue = self
		var testFactor = 2
		var primes: [Int] = []
		while (testFactor * testFactor <= remainingValue) {
			if (remainingValue % testFactor == 0) {
				primes.append(testFactor)
				remainingValue /= testFactor
			}
			else {
				testFactor += 1
			}
		}
		if (remainingValue > 1) {
			primes.append(remainingValue)
		}
		return primes
	}
}
print (81.primeFactors())
print (18.primeFactors())
print (55.primeFactors())


//Classes:
class Person {
	var firstName: String
	var lastName: String
	
	init() {
		firstName = "Yusuf"
		lastName = "Turan"
	}
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
	
	var fullName: String {
		"\(firstName) \(lastName)"
	}
}

let yusuf = Person()
print(yusuf.fullName)
let john = Person(firstName: "John", lastName: "Donny")
print(john.fullName)


//Reference Types:
//Classes are reference types -> so when you change a data in var1 its changes in var2 too.
//references inside both var1 and var2 would reference the same place in memory:
class SimplePersonSystem {
	var name: String
	init(name: String) {
		self.name = name
	}
}
var var1 = SimplePersonSystem(name: "Yusuf")
var var2 = var1
var1.name = "Mehmet"
print(var1.name) //Mehmet
print(var2.name) //Mehmet

//Conversely in a structure value types are stores the actual value:
struct SimplePersonStruct {
	var name: String
	init(name: String) {
		self.name = name
	}
}
var svar1 = SimplePersonStruct(name: "Yusuf")
var svar2 = svar1
svar1.name = "Mehmet"
print(svar1.name) //Yusuf
print(svar2.name) //Mehmet

//	!Just as the == operator checks if two values are equal, the === identity operator
// 		compares the memory address of two references. It
//Example var1  and var2 objects are same.
if(var1 === var2){
	print("They looks same memory address.")
}
else{
	print("They are looks different memory address.")
}

/*
Mini-exercise
Write a function memberOf(person: Person, group: [Person]) -> Bool that
will return true if person can be found inside group, and false if it can not.
*/
func memberOf(person: Person, group: [Person]) -> Bool {
	return group.contains(where: {$0 === person})
}
let johnny = Person(firstName: "Johnny", lastName: "Appleseed")
let jane = Person(firstName: "Jane", lastName: "Appleseed")
let anonymous1 = Person(firstName: "Bob", lastName: "Anonymous")
let anonymous2 = Person(firstName: "Bill", lastName: "Anonymous")
let anonymous3 = Person(firstName: "Biff", lastName: "Anonymous")

let group1 = [johnny, jane, anonymous1, anonymous2, anonymous3]
let group2 = [johnny, john, anonymous1, anonymous2, anonymous3]

print( memberOf(person: john, group: group1) ) //false
print( memberOf(person: john, group: group2) ) //true


//Methods and mutability:
// -> instances of classes are mutable objects whereas
//	   instances of structures are immutable values. Example:

struct Grade {
	let letter: String
	let points: Double
	let credits: Double
}

class Student {
	var firstName: String
	var lastName: String
	var grades: [Grade] = Array<Grade>()
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
	
	func recordGrade(_ grade: Grade) {
		grades.append(grade)
	}
}

let studentJane = Student(firstName: "Jane", lastName: "Mohikan")
let gradeHistory = Grade(letter: "B", points: 9.0, credits: 3.0)
let gradeMath = Grade(letter: "A", points: 16.0, credits: 4.0)

studentJane.recordGrade(gradeHistory)
studentJane.recordGrade(gradeMath)
print(studentJane.grades)
/*
Note that recordGrade(_:) can mutate the array grades by adding more values to
the end. Although this mutates the current object, the keyword mutating is not
required.
==> If you had tried this with a struct you would have wound up with a compiler error, becase struct's are immutable!
!When you change the value of the struct, instead of modifying the value, you are making a NEW VALUE.
*/

//Exercise: add GPA to your propery
class StudentExample {
	var firstName: String
	var lastName: String
	var credits: Double = 0.0
	var grades: [Grade] = Array<Grade>()
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
	
	func recordGrade(_ grade: Grade) {
		grades.append(grade)
		credits += grade.credits
	}
	
	var calcGPA: Double {
		var totalPoints = 0.0
		var totalCredits = 0.0
		
		for grade in grades {
			totalCredits += grade.credits
			totalPoints += grade.points
		}
		return totalPoints / totalCredits
	}
}

let student2 = StudentExample(firstName: "Yusfu", lastName: "Tyrean")
let student3 = StudentExample(firstName: "N", lastName: "S")
let lesson1 = Grade(letter: "A", points: 9.0, credits: 3.0)
let lesson2 = Grade(letter: "B", points: 16.0, credits: 4.0)
let lesson3 = Grade(letter: "A", points: 10.0, credits: 2.0)

student2.recordGrade(lesson1)
student3.recordGrade(lesson1)
print(student2.credits)
print("Student3 : \(student3.credits)")
student2.recordGrade(lesson2)
student3.recordGrade(lesson2)
print(student2.credits)
print("Student3 : \(student3.credits)")

print( student2.calcGPA )
student2.recordGrade(lesson3)
print(student2.credits)

//State and Side Effects:
//1: If you update a class instance with a new val every ref* to that instance will also see the new val. (the instances have state!)


//Extending a class:
extension StudentExample {
	var fullName: String {
		"Name & Surname: \(firstName)  \(lastName)"
	}
}
print(student2.fullName)


/*
A delivery range is a value -> so implement this in a struct*
A student is an object -> implement this in a class
@also: if you data will never change or you need a simple data store => use structures.
if you neeed to update data, or contain logic to update => use classes.
*/

//Challenge1: Movie App
class User {
	var lists: [String: List] = [:]
	
	func addList(_ list: List){
		lists[list.name] = list
	}
	
	func list(for name: String) -> List? {
		lists[name]
	}
}
//use struct so you can use as variable.
struct List {
	let name: String
	var movies: [String] = Array<String>()
	
	init(name: String) {
		self.name = name
	}
	
	func printOut() {
		Swift.print("\nMovie List: \(name)")
		for mov in movies {
			Swift.print(mov)
		}
		Swift.print("\n")
	}
}

let user1 = User()
let user2 = User()
var adventureMovies = List(name: "Adventure")

user1.addList(adventureMovies)
user2.addList(adventureMovies)

//add user1's fav movies:
user1.lists["Adventure"]?.movies.append("Harry Potter")
user1.lists["Adventure"]?.movies.append("LOTR")
//add user2's fav movies:
user2.lists["Adventure"]?.movies.append("Hobbit")
user2.lists["Adventure"]?.movies.append("Terminator")

user1.lists["Adventure"]?.printOut()
user2.lists["Adventure"]?.printOut()


//Inheritance in Swift
struct GradeInheritance {
	var letter: Character
	var points: Double
	var credits: Double
}

class PersonInheritance {
	var firstName: String
	var lastName: String
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}
//Student inherits Person
class StudentInheritance : PersonInheritance {
	var grades: [GradeInheritance] = Array<GradeInheritance>()
	
	func recordGrade(_ grade: GradeInheritance){
		grades.append(grade)
	}
}

let person4 = PersonInheritance(firstName: "Yusuf", lastName: "Turan")
let student4 = StudentInheritance(firstName: "Mehmet", lastName: "Tyraen")

let grade4 = GradeInheritance(letter: "C", points: 9.0, credits: 4.0)

//person4 cant use grades because it has no attribute in his class.
student4.grades.append(grade4)
print(student4.grades)

//There is no limit for subclass' sublass.
class BandMember: StudentInheritance {
	var minimumPracticeTime = 2
}
class OboePlayer: BandMember{
	override var minimumPracticeTime: Int {
		get{
			super.minimumPracticeTime * 2
		}
		set{
			super.minimumPracticeTime = newValue
		}
	}
}
//Hierarcy: OboPlayer -> BandMember -> Student -> Person

let joshua =  BandMember(firstName: "Yusuf", lastName: "Turan")
joshua.minimumPracticeTime = 4
print(joshua.minimumPracticeTime) //4

let mosh = OboePlayer(firstName: "Yusfu", lastName: "TRt")
mosh.minimumPracticeTime = 4
print(mosh.minimumPracticeTime) //8


//Polymorphism:
/*
OboePlayer is a oboeplayer but also he is a person. so you can use it anywhere you would use a person object
*/
func phoneBookNames(_ person: PersonInheritance) -> String {
	"\(person.lastName) - \(person.firstName)"
}
let joshua2 =  BandMember(firstName: "Yusuf", lastName: "Turan")
print (phoneBookNames(joshua2))
print (phoneBookNames(mosh))
