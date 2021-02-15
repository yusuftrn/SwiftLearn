//chapter23:

import Foundation

//exercise 1:
class Person {
	let name: String
	let email: String
	var car: Car?
	
	init(name: String, email: String){
		self.name = name
		self.email = email
	}
	deinit {
		print("Deleted \(name)!")
	}
}
class Car {
	let id: Int
	let type: String
	var owner: Person?
	
	init(id: Int, type: String){
		self.id = id
		self.type = type
	}
	
	deinit {
		print("Deleted \(type)")
	}
}



do {
	let own: Person = Person(name: "Y8usu", email: "yusfu@nomail.com")
	let car: Car = Car(id: 10, type: "Vvolvo")
	own.car = car
	car.owner = own
	print(own.car!)
	print(car.owner!, car.id)
}

class Customer {
	let name: String
	let email: String
	weak var account: Account?
	
	init(name: String, email: String) {
		self.name = name
		self.email = email
	}
	
	deinit {
		print("Goodbye \(name)!")
	}
}

class Account {
	let number: Int
	let type: String
	unowned let customer: Customer
	
	init(number: Int, type: String, customer: Customer) {
		self.number = number
		self.type = type
		self.customer = customer
	}
	
	deinit {
		print("Goodbye \(type) account number \(number)!")
	}
}

var customer: Customer? = Customer(name: "George", email: "george@whatever.com")
var account: Account? = Account(number: 10, type: "PayPal", customer: customer!)

customer?.account = account
print(customer?.account as Any)

account = nil
customer = nil

