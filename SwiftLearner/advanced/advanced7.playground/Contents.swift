//Error Handling

import Foundation


//First level error handling with optionals

//failable initializers:
let val = Int("3")
let failedVal = Int("data") //nil

enum PetFood: String {
	case kibble, canned
}

let morning = PetFood(rawValue: "kibble") //kibble
let snack = PetFood(rawValue: "just another food") //nil

struct PetHouse {
	let squareFeet: Int
	//basic ctor must have optional
	init?(squareFeet: Int){
		if squareFeet < 1 {
			return nil
		}
		self.squareFeet = squareFeet
	}
}

let tooSmall = PetHouse(squareFeet: 0) //nil
let house =  PetHouse(squareFeet: 5)


class Pet {
	var breed: String?
	
	init (breed: String? = nil) {
		self.breed = breed
	}
}

class Person {
	let pet: Pet
	init(pet: Pet) {
		self.pet = pet
	}
}
let delta = Pet(breed: "Pug")
let olive = Pet()
let janie = Person(pet: olive)
let xdog = Person(pet: delta)
let dogBreed = janie.pet.breed
print(xdog.pet.breed!)

//Error protocol:
class Pasty {
	let flavor: String
	var numberOnHand: Int
	
	init(flavor: String, numberOnHand: Int) {
		self.flavor = flavor
		self.numberOnHand = numberOnHand
	}
}

enum BakeryError: Error {
	case tooFew(numberOnHand: Int)
	case doNotSell
	case wrongFlavor
}

//Throw errors:
class Bakery {
	var itemsForSale = [
		"Cookie": Pasty(flavor: "Chocolate", numberOnHand: 20),
		"PopTart": Pasty(flavor: "WildBerry", numberOnHand: 13),
		"Donut": Pasty(flavor: "Cherry", numberOnHand: 6)
	]
	
	func orderPastry(item: String, amountRequested: Int, flavor: String) throws -> Int {
		guard let pastry = itemsForSale[item] else {
			throw BakeryError.doNotSell
		}
		
		guard flavor == pastry.flavor else {
			throw BakeryError.wrongFlavor
		}
		
		guard amountRequested <= pastry.numberOnHand else {
			throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
		}
		pastry.numberOnHand -= amountRequested
		return pastry.numberOnHand
	}
}

let bakery = Bakery()
do {
	try
		bakery.orderPastry(item: "Doner", amountRequested: 2, flavor: "Cherry")
} catch BakeryError.doNotSell {
	print("we dont have")
}

