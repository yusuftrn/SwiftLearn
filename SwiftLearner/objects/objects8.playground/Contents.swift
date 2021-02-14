//Protocol example:

protocol Feedable {
	func feed()
}

protocol Cleanable {
	func clean()
}

protocol Cageable: Cleanable {
	func cage()
}

protocol Tankable: Cleanable {
	func tank()
}

protocol Walkable {
	func walk()
}

class Dog: Feedable, Walkable {
	func feed() {
		print("Woof... thanks!")
	}
	
	func walk() {
		print("Walk the dog.")
	}
}

class Cat: Feedable, Cleanable {
	func feed() {
		print("Yummy meow feeded.")
	}
	
	func clean() {
		print("Cat cleans itself.")
	}
}

class Fish: Feedable, Tankable {
	func feed() {
		print("Fish goes blub")
	}
	
	func tank() {
		print("Fish has been tanked")
	}
	
	func clean() {
		print("Fish tank has been cleaned")
	}
}

class Bird: Feedable, Cageable {
	func feed() {
		print("Tweet!")
	}
	
	func cage() {
		print("Cage the bird")
	}
	
	func clean() {
		print("Clean the cage")
	}
}

let dog = Dog()
let cat = Cat()
let fish = Fish()
let bird = Bird()

let walkingAnimals: [Walkable] = [dog]
let feedingAnimals: [Feedable] = [dog, cat, fish, bird]
let tankingAnimals: [Tankable] = [fish]
let cagingAnimals: [Cageable] = [bird]
let cleaningAnimals: [Cleanable] = [cat, fish, bird]

//writing a loop for perform proper tasks for each element of each array:

for walkable in walkingAnimals {
	walkable.walk()
}

for feedable in feedingAnimals {
	feedable.feed()
}

for tankable in tankingAnimals {
	tankable.tank()
}

for cageable in cagingAnimals {
	cageable.cage()
}

for cleanable in cleaningAnimals {
	cleanable.clean()
}

