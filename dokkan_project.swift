import UIKit

var variance = 1.3

class Unit {
    var atk: Float = 1
    var leaderSkill: Float = 1.0
    var passive: Float = 1.0
    var links: Float = 1.0
    var item: Float = 1.0
    var ki: Float = 1.0
    var passive2: Float = 1.0
    var superatk: Float = 1.0
    
    func calcAtkStat() -> Float {
        return self.atk * self.leaderSkill * self.passive * self.links * self.item * self.ki * self.passive2 * self.superatk
    }//this function returns the character's atk stat to be printed
}
class Boss{
    var bossDef: Float = 1.0
    var bossDmgReduction: Float = 1.0
    
}



var vegito = Unit()
vegito.atk = 19975.0
vegito.leaderSkill = 5.4
vegito.passive = 3.0
vegito.links = 1.7
vegito.item = 1.0
vegito.ki = 2.0
vegito.passive2 = 3.0
vegito.superatk = 6.05

var kidBuu = Boss()
kidBuu.bossDef = 650000.0
kidBuu.bossDmgReduction = 0.25

print(String(format: "%.2f", vegito.calcAtkStat()))

func dmgVsBoss(_: Unit, _: Boss) {
    
}
//this will be a function to calculate different units vs different bosses
