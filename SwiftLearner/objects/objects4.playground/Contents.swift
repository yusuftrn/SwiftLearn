import Foundation

class A {
	init(){
		print("I'm A!(1)")
	}
	deinit {
		print("Destroy A")
	}
}

class B: A {
	deinit {
		print("Destroy B")
	}
	
	override init() {
		print("I'm B(1)")
		super.init()
		print("I'm B(2)")
	}
}

class C: B {
	deinit {
		print("Destroy C")
	}
	
	override init() {
		print("I'm C!(1)")
		super.init()
		print("I'm C!(2)")
	}
}

do {
	let _ = C()
}
print("----------------")
//Challenge 3: Type casting
//Cast the instance of type C to an instance of type A.
do {
	let c = C()
	let _ = c as A
}

//Challenge 4
//Create a subclass of StudentAthlete called StudentBaseballPlayer and include properties for position,
//number, and battingAverage.  What are the benefits and drawbacks of subclassing StudentAthlete in this scenario?

class Person{
	var firstName: String
	var lastName: String
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
}

struct Grade{
	let letters: String
	let points: Double
}

class Student: Person {
	var grades: [Grade] = Array<Grade>()
}

class StudentAthlete: Student{
	var sports: [String] = []
}

class StudentBaseBallPlayer: StudentAthlete{
	var battingAvarage = 0.0
	var number: Int
	var position: String
	
	init(firstName: String, lastName: String, number: Int, position: String) {
		self.number = number
		self.position = position
		super.init(firstName: firstName, lastName: lastName)
	}
}
