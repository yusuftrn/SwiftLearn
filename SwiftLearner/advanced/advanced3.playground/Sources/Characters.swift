import Foundation

public enum GameCharacterType {
	case giant
	case wizard
	case elf
}

public protocol GameCharacter: class {
	var name: String { get }
	var hitPoints: Int { get set }
	var attackPoints: Int { get set }
	var isDead: Bool { get set }
}

class Giant: GameCharacter {
	let name = "Giant"
	var hitPoints: Int = 10
	var attackPoints: Int = 3
	var isDead: Bool = false
}

class Wizard: GameCharacter {
	let name = "Wizard"
	var hitPoints: Int = 5
	var attackPoints: Int = 5
	var isDead: Bool = false
}

class Elf: GameCharacter {
	let name = "Elf"
	var hitPoints: Int = 3
	var attackPoints: Int =  10
	var isDead: Bool = false
}

public struct GameCharacterFactory {
	static public func make(ofType type: GameCharacterType) -> GameCharacter {
		switch type {
		case .giant:
			return Giant()
		case .wizard:
			return Wizard()
		case .elf:
			return Elf()
		}
	}
}

public func battle(_ char1: GameCharacter, vs char2: GameCharacter) {
	if(char2.hitPoints < char1.attackPoints){
		char2.hitPoints = 0
		char2.isDead = true
	}
	else{
		char2.hitPoints -= char1.attackPoints
	}
}
