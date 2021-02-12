import Foundation

//Challenge1: Adding raw values:
enum Coin: Int {
	case penny = 1
	case nickel = 5
	case dime = 10
	case quarter = 25
}

let coinPurse: [Coin] = [.penny, .quarter, .dime, .dime, .nickel, .penny, .quarter]

func value(_ coinPack: [Coin]) -> Int {
	var balance = 0
	for coin in coinPack{
		balance += coin.rawValue
	}
	return balance
}
print (value(coinPurse))

// An advanced way to do the same thing would be to use higher order function `reduce(_:combine:)`:
let quickPurseValue = coinPurse.reduce(0) { $0 + $1.rawValue }
print (quickPurseValue)


//Challenge2: Computing with raw values:
enum Month: Int {
	case january = 1, february, march, april, may, june, july,
		 august, september, october, november, december
	
	var monthsUntilSummer: Int {
		var monthsLeft = Month.june.rawValue - self.rawValue
		if monthsLeft < 0 {
			monthsLeft += 12
		}
		return monthsLeft
	}
}
let month = Month.november
let monthsLeft = month.monthsUntilSummer


//Challeng3: Pattern matching enumeration values:
enum Direction {
	case north
	case south
	case east
	case west
}
let movements: [Direction] = [.north, .north, .west, .south, .west, .south, .south, .east, .east, .south, .east]

var location = (x: 0, y: 0)

for mov in movements {
	switch mov {
	case .north:
		location.y += 1
	case .south:
		location.y -= 1
	case .east:
		location.x += 1
	case .west:
		location.x -= 1
	}
}

let currentX = location.x
let currentY = location.y

print("Coordinates: \(currentX), \(currentY)")
