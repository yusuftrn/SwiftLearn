//Challenge 3:

let elf = GameCharacterFactory.make(ofType: .elf)
let wizard = GameCharacterFactory.make(ofType: .wizard)
let giant = GameCharacterFactory.make(ofType: .giant)

battle(elf, vs: giant)
battle(wizard, vs: giant)
battle(wizard, vs: elf)

print(elf.hitPoints > 0 ? "I am still alive" : "Dead" )
print(wizard.hitPoints > 0 ? "I am still alive" : "Dead" )
print(giant.hitPoints > 0 ? "I am still alive" : "Dead" )
