//Memory management

import Foundation


class Agenda {
	let title: String
	unowned var author: Author
	weak var editor: Editor?
	
	init(title: String, author: Author) {
		self.title = title
		self.author  = author
	}
	
	deinit {
		print("deleted leak data \(title)")
	}
	
	lazy var description: () -> String = {
		[unowned self] in
		"\(self.title) by \(self.author.name)"
	}
	
}

class Author {
	let name: String
	var tutorials: [Agenda] = []
	
	init(name: String) {
		self.name = name
	}
	
	deinit {
		print("Goodbye author \(name)!")
	}
}

class Editor {
	let name: String
	var tutorials: [Agenda] = Array<Agenda>()
	
	init(name: String) {
		self.name = name
	}

	deinit {
		print("deleted leaked ediitor \(self.name)")
	}
}

do {
	let author = Author(name: "Cosmin")
	let tutorial = Agenda(title: "Memory management", author: author)
	print(tutorial.description())
	let editor = Editor(name: "Ray")
	author.tutorials.append(tutorial)
	tutorial.editor = editor
	editor.tutorials.append(tutorial)
	print(tutorial.title)
	print(editor.name)
}


class Customer {
	let name: String
	var card: CreditCard?
	init(name: String) {
		self.name = name
	}
	deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
	let number: UInt64
	unowned let customer: Customer
	init(number: UInt64, customer: Customer) {
		self.number = number
		self.customer = customer
	}
	deinit { print("Card #\(number) is being deinitialized") }
}

do {
	let josua = Customer(name: "Josh")
	let visa = CreditCard(number: 444333, customer: josua)
	print(visa.customer.name)
}


var counter = 0
var f = {print(counter)}
counter = 1
f()
