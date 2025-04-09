import UIKit


//Next objective for you is to learn and utilize Init to make the ability to "make" a unit, also for ease of implementing new units without needing 9+ lines for units.

class Unit {
    var name: String = "name" //unit's name
    var atk: Float = 1.0 //character attack stat
    var leaderSkill: Float = 1.0 //the amount of the leaderskill buff
    var passive: Float = 1.0 //their start of turn or non multiplicative buffs
    var links: Float = 1.0 //the total atk given from links
    var item: Float = 1.0 //atk provided by items
    var ki: Float = 1.0 //atk provided by ki
    var passive2: Float = 1.0 //multiplicative part of their passive
    var superatk: Float = 1.0 //their super attack multiplier (Including stacks)
    
    func calcAtkStat() -> Float {
        return dropDecimal(dropDecimal(dropDecimal(dropDecimal(dropDecimal(dropDecimal(dropDecimal(self.atk * self.leaderSkill) * self.passive) * self.links) * self.item) * self.ki) * self.passive2) * self.superatk)
    }
    func dmgPerUnit(_ Unit: Unit, _ Boss: Boss) -> Int {
        var dokkanVariance: Float = 1.3
        var dmgDealt = Unit.calcAtkStat() - Boss.bossDef
        var dmgDealtNormal = dmgDealt * Boss.bossDmgReduction
        var dmgDealtSE = dmgDealtNormal * 1.5
        var dmgDealtCrit = Unit.calcAtkStat() * Boss.bossDmgReduction * 1.9
        var varDmgDealtNormal = dmgDealt * dokkanVariance
        var varDmgDealtSe = dmgDealtSE * dokkanVariance
        var varDmgDealtCrit = dmgDealtCrit * dokkanVariance
            
        var averageDmgDealt = (dmgDealtNormal + dmgDealtSE + dmgDealtCrit + varDmgDealtNormal + varDmgDealtSe + varDmgDealtCrit) / 6
            
        return Int(averageDmgDealt)
        }
    }//this function returns the character's atk stat to be printed. It's math specifically wants to be done in such a way all decimal points between numbers are dropped. It looks a little messy as a result.

func dropDecimal(_ num: Float) -> Float{ //updated naming scheme from drop_decimal to dropDecimal
    return Float(Int(num))
}//this function drops the decimal off floating numbers and returns them to being a float like the game does giving more close to accurate calculations and data
import Foundation

func formatNumbers(_ num: Int) -> String{
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    var formattedNumber = formatter.string(from: NSNumber(value: num)) ?? "\(num)" //the question marks handle "Nil-Coalescing" to handle how NSNumber makes the number an optional
    return String(formattedNumber)
}//This function makes my own instance of NumberFormatter to use, sets it to .decimal then using Foundation and NSNumber it converts the number into a string with the commas.

class Boss{
    var bossName: String = "name"
    var bossDef: Float = 1.0
    var bossDmgReduction: Float = 1.0
    var bossHp: Float = 1.0
    var bossDmg: Float = 1.0
    var bossDmgSuper: Float = 1.0
    
}


var vegito = Unit() //setting up "vegito" as a class unit.
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
goku.name = "Goku"//setting up unit names for printing
goku.atk = 16935.0
goku.leaderSkill = 5.4
goku.passive = 3.0
goku.links = 1.8
goku.item = 1.0
goku.ki = 2.0
goku.passive2 = 3.4
goku.superatk = 6.05

var gotenks = Unit()
gotenks.name = "Gotenks"
gotenks.atk = 17360.0
gotenks.leaderSkill = 5.4
gotenks.passive = 3.0
gotenks.links = 1.55
gotenks.item = 1.0
gotenks.ki = 2.0
gotenks.passive2 = 4.31
gotenks.superatk = 6.2



var kidBuu = Boss() //setting up "kidbuu" as a boss
kidBuu.bossName = "Kid Buu"
kidBuu.bossDef = 650000.0
kidBuu.bossDmgReduction = 0.25
kidBuu.bossHp = 90000000.0

var broly = Boss()
broly.bossName = "Broly"
broly.bossDef = 81000
broly.bossDmgReduction = 0.3
broly.bossHp = 50000000



//print(String(format: "%.2f", vegito.calcAtkStat()))

func dmgVsBoss(_ Unit: Unit, _ Boss: Boss) {
    var dokkanVariance: Float = 1.3
    var dmgDealt = Unit.calcAtkStat() - Boss.bossDef
    var dmgDealtNormal = dmgDealt * Boss.bossDmgReduction
    var dmgDealtSE = dmgDealtNormal * 1.5
    var dmgDealtCrit = Unit.calcAtkStat() * Boss.bossDmgReduction * 1.9
    var varDmgDealtNormal = dmgDealtNormal * dokkanVariance
    var varDmgDealtSE = dmgDealtSE * dokkanVariance
    var varDmgDealtCrit = dmgDealtCrit * dokkanVariance
    //using formatNumbers to format the numbers for printing.
    var formattedDmgDealtNormalMin = formatNumbers(Int(dmgDealtNormal))
    var formattedDmgDealtNormalMax = formatNumbers(Int(varDmgDealtNormal))
    var formattedDmgDealtSEMin = formatNumbers(Int(dmgDealtSE))
    var formattedDmgDealtSEMax = formatNumbers(Int(varDmgDealtSE))
    var formattedDmgDealtCritMin = formatNumbers(Int(dmgDealtCrit))
    var formattedDmgDealtCritMax = formatNumbers(Int(varDmgDealtCrit))
    
    print("\(Unit.name) would deal between \(formattedDmgDealtNormalMin) - \(formattedDmgDealtNormalMax) on a normal hit, between \(formattedDmgDealtSEMin) - \(formattedDmgDealtSEMax) if it was super effective, and between \(formattedDmgDealtCritMin) - \(formattedDmgDealtCritMax) on a critical hit to the boss \(Boss.bossName).")
}
//This function takes a classed Unit and Boss and uses these to calculate the dmg you would deal to the boss
//A revised one might want to take 3 units and calculate the damage dealt in a turn by the three characters in the single turn then calculate about how many turns it might take to deplete a boss's hp ...look down



func dmgPerRotation(_ Unit1: Unit, _ Unit2: Unit, _ Unit3: Unit, _ Boss: Boss){ //This function will take an average of 3 units dmg and present their dmg and then
    var unit1Dmg = Unit1.dmgPerUnit(Unit1, Boss)
    var unit2Dmg = Unit2.dmgPerUnit(Unit2, Boss)
    var unit3Dmg = Unit3.dmgPerUnit(Unit3, Boss)
    var rotationDmg = unit1Dmg + unit2Dmg + unit3Dmg
    var remainingHp = Int(Boss.bossHp) - rotationDmg
    var formattedRemainingHp = formatNumbers(remainingHp)
    var formattedRotationDmg = formatNumbers(rotationDmg)
    var percentHp = Float(100.0)
    var percentRemaining = (Boss.bossHp - Float(rotationDmg)) / Boss.bossHp * 100.0
    var percentDealt = percentHp - percentRemaining
    
    print("You did \(formattedRotationDmg) this turn! The boss's health is now \(formattedRemainingHp)")
    var formattedPercentDealt = String(format: "%.2f", percentDealt)
    var formattedPercentRemaining = String(format: "%.2f", percentRemaining)
    var rotationsNeeded = Int(ceil(percentRemaining / percentDealt))
    if rotationsNeeded == 1{ //this if else handles grammar
        print("You did \(formattedPercentDealt)%  of the boss's hp this turn! The boss has \(formattedPercentRemaining)% remaining. \(rotationsNeeded) more turn like that and you win!")
    }
    else{
        print("You did \(formattedPercentDealt)%  of the boss's hp this turn! The boss has \(formattedPercentRemaining)% remaining. \(rotationsNeeded) more turns like that and you win!")
    }
}

dmgPerRotation(vegito, goku, gotenks, kidBuu)

dmgVsBoss(vegito, kidBuu)
//this will be a function to calculate different units vs different bosses

dmgVsBoss(goku, broly)
// this shows the function with a different unit and boss
