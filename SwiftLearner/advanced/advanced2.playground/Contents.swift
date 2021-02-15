//Singleton Example:

import Foundation

class Singleton {
	
	private var data: String?
	
	static var shared: Singleton = {
		let instance = Singleton()
		return instance
	}()
	
	func someBusinessLogic() -> String {
		return "Hi its done."
	}
	
	func setData(data: String) {
		self.data = data
	}
	
	func getData() -> String? {
		return data
	}
}

extension Singleton:  NSCopying {
	func copy(with zone: NSZone? = nil) -> Any {
		return self
	}
}

class Client {
	static func someClientCode() {
		let instance1 = Singleton.shared
		let instance2 = Singleton.shared
		
		//they are same object, so last one is the final output.
		instance1.setData(data: "Hey this is code of instance1")
		instance2.setData(data: "Hey this is code of instance2")
		
		if (instance1 === instance2) {
			print("Singleton works, both variables contain the same instance.")
		} else {
			print("Singleton failed, variables contain different instances.")
		}
		
		print(instance1.getData()!)
		print(instance2.getData()!)
	}
}

Client.someClientCode()
