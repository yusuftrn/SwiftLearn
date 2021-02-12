import Foundation

let months = ["January", "February", "March", "April", "May",
			  "June", "July", "August", "September", "October",
			  "November", "December"]

func semester(for month: String) -> String {
	switch month {
	case "August", "September", "October", "November", "December":
		return "Autumn"
	case "January", "February", "March", "April", "May":
		return "Spring"
	default:
		return "Not in the school year"
	}
}
print(semester(for: "April"))


//Declaring an enumeration:
enum Month{
	case january
	case february
	case march
	case april
	case may
	case june
	case july
	case august
	case september
	case october
	case november
	case december
}
print(Month.april)


/*
You can simplify the code:
enum Month {
case january, february, march, april, may, june, july, august,
september, october, november, december
}
*/

//Decipering an enumeration in a function:
func semesterWithEnum(for month: Month) -> String {
	switch month {
	case Month.august, Month.september, Month.october, Month.november, Month.december:
		return "Autumn"
	case Month.january, Month.february, Month.march, Month.april, Month.may:
		return "Spring"
	default:
		return "Not in the school year"
	}
}

//also you can use Enums with dot notation, and in Enums you dont need to describe default for switch statements:
func semesterDotNotation(for month: Month) -> String {
	switch month {
	case .august, .september, .october, .november, .december:
		return "Autumn"
	case .january, .february, .march, .april, .may:
		return "Spring"
	case .june, .july:
		return "Summer"
	}
}
var monthDot = Month.august
print( semesterDotNotation(for: monthDot)) //Autumn

enum MonthExercise {
	case january, february, march, april, may, june, july, august, september, october, november, december
	
	var semester: String {
		switch self {
		case .august, .september, .october, .november, .december:
			return "Autumn"
		case .january, .february, .march, .april, .may:
			return "Spring"
		case .june, .july:
			return "Summer"
		}
	}
}
var monthExercise = MonthExercise.september
print("\(monthExercise): \(monthExercise.semester)")


//Raw values:
enum RawMonth: Int {
	case january = 1
	case february = 2
	case march = 3
	case april = 4
	case may = 5
	case june = 6
	case july = 7
	case august = 8
	case september = 9
	case october = 10
	case november = 11
	case december = 12
}
/*
Another shortcut is here:

enum Month: Int {
case january = 1, february, march, april, may, june, july,
august, september, october, november, december
}

It's add another's to 2...12
*/

//Accesing the raw value

func monthsUntilWinterBreak(from month: RawMonth) -> Int {
	RawMonth.december.rawValue - month.rawValue
}
print(monthsUntilWinterBreak(from: .april)) //8

var fifthMonth = RawMonth(rawValue: 5)
print(fifthMonth)
//It's return as optinoal because there is no guarantee
//for rawValue: 5 is in enum data. So it can return "nil"
fifthMonth = fifthMonth!

/*
ERROR:
monthsUntilWinterBreak(from: fifthMonth) //cannot unwrapped

Use this: " ! "
*/

print(monthsUntilWinterBreak(from: fifthMonth!))

//Make monthsUntilWinterBreak a computed property of the MonthNew enumeration, so
//that you can execute the following code:
enum MonthNew: Int {
	case january = 1, february, march, april, may, june, july, august, september, october, november, december
	
	var monthsUntilWinterBreak: Int {
		MonthNew.december.rawValue - rawValue
	}
}
let sixthMonth = MonthNew(rawValue: 6)!
let monthsLeft = sixthMonth.monthsUntilWinterBreak
print(monthsLeft)


//String raw values:
enum Icon: String {
	case music
	case sports
	case weather
	
	var fileName: String {
		"\(rawValue).png"
	}
}
let weatherIcon = Icon.weather
let musicIcon = Icon.music
print(weatherIcon.fileName)
print(musicIcon.fileName)


//Unordered raw values:
enum Coin: Int {
	case penny = 1
	case nickel = 5
	case dime = 10
	case quarter = 25
}
let coin = Coin.quarter
print(coin.rawValue)

//Create an array called coinPurse that contains coins. Add an assortment of pennies, nickels, dimes and quarters to it
let coinPurse: [Coin] = [.penny, .quarter, .dime, .dime, .nickel, .penny, .quarter]

var totalCredit = 0
for coin in coinPurse {
	print("I have \(coin.rawValue) cent.")
	totalCredit += coin.rawValue
}
print("so totaly i have \(totalCredit) cent.")

/*
Associated values
Associated values take Swift enumerations to the next level in expressive power.
They let you associate a custom value (or values) with each enumeration case.
Here are some unique qualities of associated values:
1. Each enumeration case has zero or more associated values.
2. The associated values for each enumeration case have their own data type.
3. You can define associated values with label names like you would for named
function parameters.
*/

/*
An enumeration can have raw values or associated values, but not both.
In the last mini-exercise, you defined a coin purse. Let’s say you took your money to
the bank and deposited it. You could then go to an ATM and withdraw your money:
*/
var creditBalance = 100

enum WithdrawalResult {
	case success(newBalance: Int)
	case error(message: String)
}
func withdraw(amount: Int) -> WithdrawalResult {
	if(amount <= creditBalance){
		creditBalance -= amount
		return .success(newBalance: creditBalance)
	}
	else{
		return .error(message: "Not enought money!")
	}
}

//Now you can perform a withdrawal and handle the result:
let result = withdraw(amount: 45)
switch result {
case .success(let newBalance):
	print("Your new balance is: \(newBalance)")
case .error(let message):
	print(message)
}


//For example, internet servers often use enumerations to differentiate between types
//of requests:
enum HTTPMethod {
	case get
	case post(body: String)
}
let request = HTTPMethod.post(body: "Hi there!")

guard case .post(let body) = request else {
	fatalError("No message was posted.")
}
print(body)


//Enumeration as state machine:
enum TrafficLight {
	case red, yellow, green
}
let trafficLight = TrafficLight.red


//Enum: iterating through all cases:
enum Pet: CaseIterable {
	case cat, dog, bird, turtle, fish, hamster
}

for pet in Pet.allCases {
	print("I like my \(pet)")
}


enum Math {
	static let e = 2.7183
	
	static func factorial(of number: Int) -> Int {
		return (1...number).reduce(1, *)
	}
}

let nestEgg = 25000 * pow(Math.e, 0.07 * 20)
print(nestEgg)

//Optionals
/*Optionals are really enumerations with two cases:
1. .none means there’s no value.
2. .some means there is a value, which is attached to the enumeration case as an
associated value.*/
var age: Int?
age = 17
age = nil

switch age {
case .none:
	print("No value")
case .some(let value):
	print("Got a value: \(value)")
}
print(age as Any)
age = 19
print(age!)

var optionalNil: Int?
optionalNil == nil		//true
optionalNil == .none	//true
optionalNil == 5
