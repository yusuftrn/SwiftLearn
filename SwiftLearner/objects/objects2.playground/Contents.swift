//
//  object.swift
//  SwiftLearner
//
//  Created by Yusuf Turan on 11.02.2021.
//
import Foundation


//Creating Classes:

class Person{
	var firstName: String
	var lastName: String
	
	init(firstName: String, lastName: String){
		self.firstName = firstName
		self.lastName = lastName
	}
	var fullName: String{
		"\(firstName) \(lastName)"
	}
}
let john = Person(firstName: "Johnny", lastName: "Appleseed")

//Working with references:
struct Location{
	let x: Int
	let y: Int
}
struct DeliveryArea{
	var range: Double
	var center: Location
}

var area1 = DeliveryArea(range: 2.5, center: Location(x: 2, y: 4))
var area2 = area1
print(area1.range) //2.5
print(area2.range) //2.5

area1.range = 4
print(area1.range) //4
print(area2.range) //2.5

//References (in class)
var homeOwner = john
john.firstName = "John"
print(john.firstName) //John
print(homeOwner.firstName) //John

var homeSeller = Person(firstName: "Rich", lastName: "Salesman")

//Object identity: ===
print(john === homeOwner) //true
print(john === homeSeller) //true
// ERROR: print(area1 === area2) //Object should be deriver from class


//Methods Mutability:
struct Grade{
	let letter: String
	let points: Double
	let credits: Double
}

class Student{
	var firstName: String
	var lastName: String
	var credits: Double = 0.0
	var grades: [Grade] = Array<Grade>()
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
	
	func recordGrade(_ grade: Grade){
		grades.append(grade)
		credits += grade.credits
	}
	
	var calcGPA: Double{
		var totalPoints = 0.0
		var totalCredits = 0.0
		for grade in grades {
			totalPoints += grade.points
			totalCredits += grade.credits
		}
		return totalPoints / totalCredits
	}
}

let jane = Student(firstName: "Jane", lastName: "Appleseed")
print(jane.credits)
let history = Grade(letter: "B", points: 9.0, credits: 3.0)
let math = Grade(letter: "A", points: 16.0, credits: 4.0)

jane.recordGrade(history)
jane.recordGrade(math)
print(jane.calcGPA)

//////////// INHERİTANCE ////////////
struct GradeInherit{
	let letter: String
	let points: Double
	let credits: Double
}

class PersonInherit{
	var firstName: String
	var lastName: String
	
	init(firstName: String, lastName: String){
		self.firstName = firstName
		self.lastName = lastName
	}
	var fullName: String{
		"\(firstName) \(lastName)"
	}
}

class StudentInherit: PersonInherit {
	var grades: [GradeInherit] = Array<GradeInherit>()
	
	func recordGrade(_ grade: GradeInherit){
		grades.append(grade)
	}
	
	var calcGPA: Double{
		var totalPoints = 0.0
		var totalCredits = 0.0
		for grade in grades {
			totalPoints += grade.points
			totalCredits += grade.credits
		}
		return totalPoints / totalCredits
	}
}
let johny = PersonInherit(firstName: "Johnny", lastName: "Appleseed")
let jany = StudentInherit(firstName: "Jahne", lastName: "Appleseed")

let histo = GradeInherit(letter: "B", points: 9.0, credits: 3.0)
jany.recordGrade(histo)
//johny.recordGrade(histo) -> johny is a person, not student!


//Inheritance, methods and overrides:
class StudentAthlete: StudentInherit {
	var failedClasses: [GradeInherit] = Array<GradeInherit>()
	
	override func recordGrade(_ grade: GradeInherit) {
		super.recordGrade(grade)
		
		if (grade.letter == "F"){
			failedClasses.append(grade)
		}
	}
	var isEligible: Bool{
		failedClasses.count < 3
	}
}

let athleteJohn = StudentAthlete(firstName: "John", lastName: "Mohn")

let lesson1 = GradeInherit(letter: "F", points: 1.0, credits: 3.0)
let lesson2 = GradeInherit(letter: "F", points: 4.0, credits: 3.0)
let lesson3 = GradeInherit(letter: "F", points: 3.0, credits: 3.0)
let lesson4 = GradeInherit(letter: "A", points: 3.5, credits: 3.0)

athleteJohn.recordGrade(lesson1)
athleteJohn.recordGrade(lesson2)
athleteJohn.recordGrade(lesson3)
athleteJohn.recordGrade(lesson4)

print(athleteJohn.calcGPA)
print(athleteJohn.failedClasses)
print(athleteJohn.isEligible)


/* Preventing Inheritance
final class FinalStudent: PersonInherit {}
class FinalStudentAthlete: FinalStudent {} //Build error. You cant inherit final class.
*/

/*
Additionally, you can mark individual methods as final, if you want to allow a class
to have subclasses, but protect individual methods from being overridden:
class AnotherStudent: PersonInherit {
final func recordGrade(_ grade: Grade) {} //It's final method
}
class AnotherStudentAthlete: AnotherStudent {
override func recordGrade(_ grade: Grade) {} //BUILD ERROR!
}

*/


//Inheritance and class Initialization:
class StudentAthleteNew: StudentInherit {
	var sports: [String]
	
	init(firstName: String, lastName: String, sports: [String]) {
		self.sports = sports
		super.init(firstName: firstName, lastName: lastName)
	}
}
let hobbySports: [String] = ["Hokey", "Swimming", "Basketball"]
let athleteYosef = StudentAthleteNew(firstName: "Yusuf", lastName: "Turan", sports: hobbySports)

for s in athleteYosef.sports{
	print(s)
}

