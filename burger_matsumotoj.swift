
import UIKit
//structure holding optionals in case an item isn't wanted
//enum tempForMeat{
//    case rare
//    case medium
//    case wellDone
//}
//
//enum kindOfBun{
//    case broiche
//    case pretzel
//    case seasame
//} This didn't work, the print would give strange info that isn't readable for me
//topping: ("lettuce", "tomato", "mayo", "pickle")
struct Burger {
    var bun:String?
    var toppings:[String?]
    var temp:String?
    var numPatties:Int?
    var cheese:String?
}
var orderedBurger = Burger(bun: "pretzel",toppings:["lettuce", "tomato", "mayo", "pickle"], temp: "medium", numPatties: 2, cheese: "pepperjack")
print(orderedBurger)
var otherOrderedBurger = Burger(bun: "brioche",toppings:["lettuce", "mayo", "pickle"], temp: "well-done", numPatties: 1)
print(otherOrderedBurger)
print("Can I get a burger with a \(String(describing: otherOrderedBurger.bun))bun with \(String(describing: otherOrderedBurger.numPatties)) patties, cooked \(String(describing: otherOrderedBurger.temp)),  with \(otherOrderedBurger.toppings) and \(String(describing: otherOrderedBurger.cheese)) cheese on the fly please!")
print("Can I get a burger with a \(String(describing: orderedBurger.bun))bun with \(String(describing: orderedBurger.numPatties)) patties, cooked \(String(describing: orderedBurger.temp)),  with \(orderedBurger.toppings) and \(String(describing: orderedBurger.cheese)) cheese on the fly please!")

