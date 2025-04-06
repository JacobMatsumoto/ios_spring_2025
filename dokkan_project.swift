import UIKit




class Unit {
    var name: String = "name"
    var atk: Float = 1.0
    var leaderSkill: Float = 1.0
    var passive: Float = 1.0
    var links: Float = 1.0
    var item: Float = 1.0
    var ki: Float = 1.0
    var passive2: Float = 1.0
    var superatk: Float = 1.0
    
    func calcAtkStat() -> Float {
        return drop_decimal(drop_decimal(drop_decimal(drop_decimal(drop_decimal(drop_decimal(drop_decimal(self.atk * self.leaderSkill) * self.passive) * self.links) * self.item) * self.ki) * self.passive2) * self.superatk)
    }//this function returns the character's atk stat to be printed
}
class Boss{
    var bossName: String = "name"
    var bossDef: Float = 1.0
    var bossDmgReduction: Float = 1.0
    
}
func drop_decimal(_ num: Float) -> Float{
    return Float(Int(num))
}//this function drops the decimal off floating numbers and returns them to being a float like the game does giving more close to accurate calculations and data


var vegito = Unit()
vegito.name = "Vegito"
vegito.atk = 19975.0
vegito.leaderSkill = 5.4
vegito.passive = 3.0
vegito.links = 1.7
vegito.item = 1.0
vegito.ki = 2.0
vegito.passive2 = 3.0
vegito.superatk = 6.05

var goku = Unit()
goku.name = "Goku"
goku.atk = 16935.0
goku.leaderSkill = 5.4
goku.passive = 3.0
goku.links = 1.8
goku.item = 1.0
goku.ki = 2.0
goku.passive2 = 3.4
goku.superatk = 6.05

var kidBuu = Boss()
kidBuu.bossName = "Kid Buu"
kidBuu.bossDef = 650000.0
kidBuu.bossDmgReduction = 0.25
var broly = Boss()
broly.bossName = "Broly"
broly.bossDef = 81000
broly.bossDmgReduction = 0.3


func commas(_ num: Float) {
    
            
    
}


//print(String(format: "%.2f", vegito.calcAtkStat()))

func dmgVsBoss(_ Unit: Unit, _ Boss: Boss) -> Int {
    var dokkanVariance: Float = 1.3
    var dmgDealt = Unit.calcAtkStat() - Boss.bossDef
    dmgDealt = dmgDealt * Boss.bossDmgReduction
    var varDmgDealt = dmgDealt * dokkanVariance
    var dmgDealtCrit = Unit.calcAtkStat() * Boss.bossDmgReduction * 1.9
    print("\(Unit.name) would deal between \(Int(dmgDealt))-\(Int(varDmgDealt)) on a normal hit. Between \(Int(dmgDealt * 1.5))-\(Int(varDmgDealt * 1.5)) if it was super effective. And between \(Int(dmgDealtCrit))-\(Int(dmgDealtCrit * dokkanVariance)) on a crit to the boss \(Boss.bossName)")

    return Int(dmgDealt)
}//This function takes a classed Unit and Boss and uses these to calculate the dmg you would deal to the boss
//A revised one might want to take 3 units and calculate the damage dealt in a turn by the three characters in the single turn then calculate about how many turns it might take to deplete a boss's hp

dmgVsBoss(vegito, kidBuu)
//this will be a function to calculate different units vs different bosses

dmgVsBoss(goku, broly)
