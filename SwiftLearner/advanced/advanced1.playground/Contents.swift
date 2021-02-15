//Challenge:1 Singleton Pattern
import Foundation

class Logger {
	
	//singleton always has a private init.
	private init() {}
	
	static let sharedInstance = Logger()
	
	func log(_ text: String) {
		print(text)
	}
}
var logger1 = Logger.sharedInstance
var logger2 = Logger.sharedInstance

class Debugger {
	
	//singleton always has a private init.
	private init() {}
	
	static let sharedInstance = Debugger()
	
	func debug(_ text: String) {
		print(text)
	}
}
var debugger1 = Debugger.sharedInstance
var debugger2 = Debugger.sharedInstance

//Logger and Debugger objects has only one.
print(logger1)
print(logger2)
print(debugger1)
print(debugger2)


//Stack Data Type:
struct Stack<Element> {
	private var elements: [Element] = []
	
	var count: Int {
		return elements.count
	}
	
	func peek() -> Element? {
		return  elements.last
	}
	
	mutating func push(_ e: Element) {
		elements.append(e)
	}
	
	mutating func pop() -> Element? {
		if (elements.isEmpty) {
			return nil
		}
		
		return elements.removeLast()
	}
}

var data = Stack<String>()
data.push("Dat")
data.push("is")
data.push("awesome")

print(data.peek()!)
data.pop()
print(data.peek()!)
 
