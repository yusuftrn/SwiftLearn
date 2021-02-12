import Foundation

/*
Two-phase initialization
Because of Swift’s requirement that all stored properties have initial values,
initializers in subclasses must adhere to Swift’s convention of two-phase
initialization.
• Phase one: Initialize all of the stored properties in the class instance, from the
bottom to the top of the class hierarchy. You can’t use properties and methods
until phase one is complete.
• Phase two: You can now use properties and methods, as well as initializations
that require the use of self.
Without two-phase initialization, methods and operations on the class might
interact with properties before they’ve been initialized.
The transition from phase one to phase two happens after you’ve initialized all
stored properties in the base class of a class hierarchy.
In the scope of a subclass initializer, you can think of this as coming after the call to
super.init.
*/
class Person{
	let firstName: String
	let lastName: String
	
	init(firstName: String, lastName: String) {
		self.firstName = firstName
		self.lastName = lastName
	}
	var fullName : String {
		"\(firstName) \(lastName)"
	}
}

struct Grade{
	let letter: String
	let points: Double
	let credits: Double
}

class Student: Person {
	var grades: [Grade] = Array<Grade>()
	
	func recordGrade(_ grade: Grade){
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

class StudentAthlete: Student {
	var sports: [String]
	var failedClasses: [Grade] = Array<Grade>()
	
	init(firstName: String, lastName: String, sports: [String]) {
		//1
		self.sports = sports
		//2
		let passGrade = Grade(letter:"P", points: 0.0, credits: 0.0)
		//3
		super.init(firstName: firstName, lastName: lastName)
		//4
		recordGrade(passGrade)
	}
	
	override func recordGrade(_ grade: Grade) {
		super.recordGrade(grade)
		
		if (grade.letter == "F"){
			failedClasses.append(grade)
		}
	}
	
	var isEligible: Bool{
		failedClasses.count < 3
	}
}

let mySports = ["Basketball", "Cycling", "Swimming"]
let yusuf = StudentAthlete(firstName: "Yusuf", lastName: "Turan", sports: mySports)
print(yusuf.fullName)
print(yusuf.sports)

/*
The above initializer shows two-phase initialization in action.
1. First, you initialize the sports property of StudentAthlete. This is part of the
first phase of initialization and has to be done early, before you call the
superclass initializer.
2. Although you can create local variables for things like grades, you can’t call
recordGrade(_:) yet because the object is still in the first phase.
3. Call super.init. When this returns, you know that you’ve also initialized every
class in the hierarchy, because the same rules are applied at every level.
4. After super.init returns, the initializer is in phase 2, so you call
recordGrade(_:).
*/

//Required and convenience initializers

class StudentTransfer{
	let firstName: String
	let lastName: String
	var grades: [Grade] = []
	
	init(firstName: String, lastName: String){
		self.firstName = firstName
		self.lastName = lastName
	}
	
	init(transfer: StudentTransfer){
		self.firstName = transfer.firstName
		self.lastName = transfer.lastName
	}
	
	func recordGrade(_ grade: Grade){
		grades.append(grade)
	}
}
/*
In this example, the StudentTransfer class can be built with another Student object. Perhaps
the student switched majors? Both initializers fully set the first and last names
*/
 
//You might decide the first and last name-based initializer is important enough that
//you want it to be available to all subclasses => use: required init()
class StudentRequiredInit{
	let firstName: String
	let lastName: String
	var grades: [Grade] = []
	
	required init(firstName: String, lastName: String){
		self.firstName = firstName
		self.lastName = lastName
	}
	
}

class StudentNerdsTeam: StudentRequiredInit{
	var hobbys: [String]
	//now required by the compiler:
	required init(firstName: String, lastName: String) {
		self.hobbys = []
		super.init(firstName: firstName, lastName: lastName)
	}
	
	func printMyData(){
		print("\(self.firstName) \(self.lastName)")
		print("\(self.hobbys)")
	}
}
let nerdStudent = StudentNerdsTeam(firstName: "Yusuf", lastName: "Turan")
nerdStudent.hobbys.append("Coding")
nerdStudent.hobbys.append("More Coding")
nerdStudent.printMyData()


class Team {
	var players: [StudentAthlete] = Array<StudentAthlete>()
	
	var isEligible: Bool {
		for player in players {
			if (!player.isEligible) {
				return false
			}
		}
		return true
	}
}

//Shared Base Classes:
// a button that can be pressed:
class Button {
	func press() {}
}

class Image {}

class ImageButton: Button {
	var image: Image
	
	init(image: Image) {
		self.image = image
	}
}

class TextButton: Button {
	var text: String
	
	init(text: String) {
		self.text = text
	}
}
///////

//Retain cylces and weak references:



