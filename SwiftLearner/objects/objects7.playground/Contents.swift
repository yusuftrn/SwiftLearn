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

