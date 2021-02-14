//Challenge:

class Cat {
	var name: String
	init(name: String) {
		self.name = name
	}
}
class Dog {
	var name: String
	init(name: String) {
		self.name = name
	}
}

class Keeper<Animal> {
	var name: String
	
	private var animals: [Animal] = []

	
	init(name: String) {
		self.name = name
	}
	
	func lookAfter(_ animal: Animal) -> Void {
		animals.append(animal)
	}
	
	func getAnimals() -> [Animal] {
		return animals
	}
	
	var count: Int {
		animals.count
	}
	
	func removeLast() -> Animal {
		animals.removeLast()
	}

	func animal(at index: Int) -> Animal {
		animals[index]
	}
}

let josh = Keeper<Cat>(name: "Joseph")
josh.lookAfter(Cat.init(name: "Tekir"))
josh.lookAfter(Cat.init(name: "Maviş"))
josh.lookAfter(Cat.init(name: "Garfield"))

print("index 1 Cat: \(josh.animal(at: 1).name)")
for i in josh.getAnimals() {
	print("i feed \(i.name)")
}
