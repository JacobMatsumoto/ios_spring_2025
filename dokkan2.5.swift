import UIKit

//Agl > Str
//Str > Phy
//Phy > Int
//Int > Teq
//Teq > Agl

let critMulti: Float = 1.9
let superEffective: Float = 1.5
let dokkanVariance: Float = 1.03
//let unitGuard: Float = 0.5 units with guard have 0.5 innate,



class Unit {
    var unitClass: Bool = true //hero or villain unit, needed for math and a new function true is hero false is villain heros deal more and take more dmg from villains but do less and take less from other hero class enemies and vice versa or villains vs heros. the math would go if unitClass = true and bossClass = false or false true the multiplier is one thing, and if its true true or false false its another, ignored if the unit has guard set to true
    var hasGuard: Bool = false // guard to ignore type altogether
    var unitType: String = "Agl Str Phy Int Teq"
    
    var name: String = "name" //unit's name
    var atk: Float = 1.0 //character attack stat
    var leaderSkill: Float = 1.0 //the amount of the leaderskill buff
    var passive: Float = 1.0 //their start of turn or non multiplicative buffs
    var links: Float = 1.0 //the total atk given from links
    var item: Float = 1.0 //atk provided by items
    var ki: Float = 1.0 //atk provided by ki
    var passive2: Float = 1.0 //multiplicative part of their passive
    var superatk: Float = 1.0 //their super attack multiplier (Including stacks)
    
    var unitDef: Float = 1.0 //unit base defense
    
    var unitDefLead: Float = 1.0 // def from leaderskill
    var unitDefPassive: Float = 1.0 //unit's start of turn def boost
    
    var unitDefPassive2: Float = 1.0 //unit's def from attacking, from ki based passive boosts, anything multiplicative
    
    var unitDefOnSuper: Float = 1.0// unit def boost from supering. includes stacks
    
    var unitDefLink: Float = 1.0 //unit def boost from links
    
    var unitDmgRedItem: Float = 1.0 //dmg reduction from items, it is added to innate dmg reduction
    var unitDmgRed: Float = 1.0 // dmg reduction from passives
    //split these up on top to group ones that need to be added together for calculations
    
    init(unitClass: Bool, hasGuard: Bool, unitType: String, name: String, atk: Float, leaderSkill: Float, passive: Float, links: Float, item: Float, ki: Float, passive2: Float, superatk: Float, unitDef: Float, unitDefLead: Float, unitDefPassive: Float, unitDefPassive2: Float, unitDefOnSuper: Float, unitDefLink: Float, unitDmgRedItem: Float, unitDmgRed: Float) {
        self.unitClass = unitClass
        self.hasGuard = hasGuard
        self.unitType = unitType
        self.name = name
        self.atk = atk
        self.leaderSkill = leaderSkill
        self.passive = passive
        self.links = links
        self.item = item
        self.ki = ki
        self.passive2 = passive2
        self.superatk = superatk
        self.unitDef = unitDef
        self.unitDefLead = unitDefLead
        self.unitDefPassive = unitDefPassive
        self.unitDefPassive2 = unitDefPassive2
        self.unitDefOnSuper = unitDefOnSuper
        self.unitDefLink = unitDefLink
        self.unitDmgRedItem = unitDmgRedItem
        self.unitDmgRed = unitDmgRed
    }
//    func calcAtkStat() -> Float {
//        return dropDecimal(dropDecimal(dropDecimal(dropDecimal(dropDecimal(dropDecimal(dropDecimal(self.atk * self.leaderSkill) * self.passive) * self.links) * self.item) * self.ki) * self.passive2) * self.superatk)
//    }
//    commented out because it is outdated. keeping it here visually to show where the one below comes from they produce the same results
    func calcAtkStat() -> Float{ //updated this to be easier to read and see what is happening,
        var attack = dropDecimal(self.atk * self.leaderSkill)
        attack = dropDecimal(attack * self.passive)
        attack = dropDecimal(attack * self.links)
        attack = dropDecimal(attack * self.item)
        attack = dropDecimal(attack * self.ki)
        attack = dropDecimal(attack * self.passive2)
        attack = dropDecimal(attack * self.superatk)
        return attack
    }
    
    func calcDefStatAfterAtk() -> Float{
        var defense = dropDecimal(self.unitDef * self.unitDefLead)
        defense = dropDecimal(defense * self.unitDefPassive)
        defense = dropDecimal(defense * self.unitDefLink)
        defense = dropDecimal(defense * self.unitDefPassive2)
        defense = dropDecimal(defense * self.unitDefOnSuper)
        return defense
    }
    
    func calcDefStatBeforeAtk() -> Float{
        var defense = dropDecimal(self.unitDef * self.unitDefLead)
        defense = dropDecimal(defense * self.unitDefPassive)
        defense = dropDecimal(defense * self.unitDefLink)
        return defense
    }
    
    
    func dmgPerUnit(_ Unit: Unit, _ Boss: Boss) -> Int {
        let (typeMulti, guardMulti) = typeCalc(Unit, Boss)
        var dmgDealt = Unit.calcAtkStat() - Boss.bossDef
        var dmgDealtNormal = dmgDealt * Boss.bossDmgReduction * typeMulti * guardMulti
        var dmgDealtSE = dmgDealtNormal * superEffective
        var dmgDealtCrit = Unit.calcAtkStat() * Boss.bossDmgReduction * critMulti
        var varDmgDealtNormal = dmgDealt * dokkanVariance * typeMulti * guardMulti //more accurate damage calcs
        var varDmgDealtSe = dmgDealtSE * dokkanVariance
        var varDmgDealtCrit = dmgDealtCrit * dokkanVariance
            
        var averageDmgDealt = (dmgDealtNormal + dmgDealtSE + dmgDealtCrit + varDmgDealtNormal + varDmgDealtSe + varDmgDealtCrit) / 6
            
        return Int(averageDmgDealt)
        }

    }//this function returns the character's atk stat to be printed. It's math specifically wants to be done in such a way all decimal points between numbers are dropped. It looks a little messy as a result.
class Boss{
    var bossName: String = "name"
    var bossClass: Bool = false
    var bossSE: Bool = true
    var bossType: String = "Agl Str Phy Int Teq"
    var bossDef: Float = 1.0
    var bossDmgReduction: Float = 1.0
    var bossHp: Float = 1.0
    var bossDmg: Float = 1.0
    var bossDmgSuper: Float = 1.0
    
    init(bossName: String, bossClass: Bool, bossSE: Bool, bossType: String, bossDef: Float, bossDmgReduction: Float, bossHp: Float, bossDmg: Float, bossDmgSuper: Float) {
        self.bossName = bossName
        self.bossClass = bossClass
        self.bossSE = bossSE
        self.bossType = bossType
        self.bossDef = bossDef
        self.bossDmgReduction = bossDmgReduction
        self.bossHp = bossHp
        self.bossDmg = bossDmg
        self.bossDmgSuper = bossDmgSuper
    }
    
}
func dropDecimal(_ num: Float) -> Float{ //updated naming scheme from drop_decimal to dropDecimal
    return floor(num)
}//this function drops the decimal off floating numbers and returns them to being a float like the game does giving more close to accurate calculations and data

import Foundation //I am keeping this here as its the only use of it so far
func formatNumbers(_ num: Int) -> String{
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    var formattedNumber = formatter.string(from: NSNumber(value: num)) ?? "\(num)" //the question marks handle "Nil-Coalescing" to handle how NSNumber makes the number an optional
    return String(formattedNumber)
}//This function makes my own instance of NumberFormatter to use, sets it to .decimal then using Foundation and NSNumber it converts the number into a string with the commas.


var gogeta = Unit(unitClass: true, hasGuard: false, unitType: "Teq", name: "Gogeta", atk: 21525.0, leaderSkill: 4.4, passive: 4.0, links: 1.55, item: 1.0, ki: 2.0, passive2: 1.5, superatk: 6.95, unitDef: 15925.0, unitDefLead: 4.4, unitDefPassive: 3.9, unitDefPassive2: 1.5, unitDefOnSuper: 1.5, unitDefLink: 1.05, unitDmgRedItem: 0.0, unitDmgRed: 0.60)
//note stacking units do not benefit from the stack on their first attack gaining it, they do gain it at the end of the super example being on an additional attack.
//var vegito = Unit(name: "Vegito", atk: 19975.0, leaderSkill: 5.4, passive: 3.0, links: 1.7, item: 1.0, ki: 2.0, passive2: 3.0, superatk: 6.05) //setting up "vegito" as a class unit.
var vegito = Unit(unitClass: true, hasGuard: false, unitType: "Teq", name: "Vegito", atk: 19975.0, leaderSkill: 5.4, passive: 3.0, links: 1.7, item: 1.0, ki: 2.0, passive2: 3.0, superatk: 6.05, unitDef: 13888, unitDefLead: 5.4, unitDefPassive: 3.4, unitDefPassive2: 1.0, unitDefOnSuper: 2.0, unitDefLink: 1.05, unitDmgRedItem: 0.0, unitDmgRed: 0.50)
//vegito.name = "Vegito"
//vegito.atk = 19975.0
//vegito.leaderSkill = 5.4
//vegito.passive = 3.0
//vegito.links = 1.7
//vegito.item = 1.0
//vegito.ki = 2.0
//vegito.passive2 = 3.0
//vegito.superatk = 6.05
var goku = Unit(unitClass: true, hasGuard: true, unitType: "Agl", name: "Ssj 3 Kid Goku", atk: 16935.0, leaderSkill: 5.4, passive: 3.0, links: 1.8, item: 1.0, ki: 2.0, passive2: 3.4, superatk: 3.4, unitDef: 12506.0, unitDefLead: 5.4, unitDefPassive: 3.0, unitDefPassive2: 3.4, unitDefOnSuper: 1.5, unitDefLink: 1.25, unitDmgRedItem: 0.0, unitDmgRed: 0.0)
//var goku = Unit(name: "Goku", atk: 16935.0, leaderSkill: 5.4, passive: 3.0, links: 1.8, item: 1.0, ki: 2.0, passive2: 3.4, superatk: 6.05)
//goku.name = "Goku"//setting up unit names for printing
//goku.atk = 16935.0
//goku.leaderSkill = 5.4
//goku.passive = 3.0
//goku.links = 1.8
//goku.item = 1.0
//goku.ki = 2.0
//goku.passive2 = 3.4
//goku.superatk = 6.05

//var gotenks = Unit(name: "Gotenks", atk: 17360.0, leaderSkill: 5.4, passive: 3.0, links: 1.55, item: 1.0, ki: 2.0, passive2: 4.31, superatk: 6.2)
//gotenks.name = "Gotenks"
//gotenks.atk = 17360.0
//gotenks.leaderSkill = 5.4
//gotenks.passive = 3.0
//gotenks.links = 1.55
//gotenks.item = 1.0
//gotenks.ki = 2.0
//gotenks.passive2 = 4.31
//gotenks.superatk = 6.2

var fauxName = "Super Saiyan 9001 Gogito"
var fauxAtk: Float = 99999.0
var fauxLeader: Float = 10.0
var fauxPassive: Float = 50.0
var fauxLinks: Float = 2.0
var fauxItems: Float = 1.0
var fauxKi: Float = 2.0
var fauxPassive2: Float = 20.0
var fauxSuperAtk: Float = 10.0
//
//var fauxUnit = Unit(name: fauxName, atk: fauxAtk, leaderSkill: fauxLeader, passive: fauxPassive, links: fauxLinks, item: fauxItems, ki: fauxKi, passive2: fauxPassive2, superatk: fauxSuperAtk)


var kidBuu = Boss(bossName: "Kid Buu", bossClass: false, bossSE: true, bossType: "Str", bossDef: 650000, bossDmgReduction: 0.25, bossHp: 90000000, bossDmg: 650000.0, bossDmgSuper: 2275000.0)
var kidBuuTest = Boss(bossName: "Kid Buu", bossClass: false, bossSE: true, bossType: "Str", bossDef: 1650000, bossDmgReduction: 0.25, bossHp: 90000000, bossDmg: 1000000.0, bossDmgSuper: 2275000.0)
//kidBuu.bossName = "Kid Buu"
//kidBuu.bossDef = 650000.0
//kidBuu.bossDmgReduction = 0.25
//kidBuu.bossHp = 90000000.0

/*var broly = Boss(bossName: "Broly", bossDef: 81000, bossDmgReduction: 0.3, bossHp: 50000000, bossDmg: 1, bossDmgSuper: 1)*/
//broly.bossName = "Broly"
//broly.bossDef = 81000
//broly.bossDmgReduction = 0.3
//broly.bossHp = 50000000

var fauxBossName = "Base Cabba"
var fauxBossDef: Float = 9
var fauxBossDmgReduction: Float = 0.01
var fauxBossHp: Float = 10000000000
var fauxBossDmg: Float = 50000000
var fauxBossSuper: Float = 1000000000

//var fauxBoss = Boss(bossName: fauxBossName, bossDef: fauxBossDef, bossDmgReduction: fauxBossDmgReduction, bossHp: fauxBossHp, bossDmg: fauxBossDmg, bossDmgSuper: fauxBossSuper)

//print(String(format: "%.2f", vegito.calcAtkStat()))

func dmgVsBoss(_ Unit: Unit, _ Boss: Boss) {
    var dmgDealt = Unit.calcAtkStat() - Boss.bossDef
    var dmgDealtNormal = dmgDealt * Boss.bossDmgReduction
    var dmgDealtSE = dmgDealtNormal * superEffective
    var dmgDealtCrit = Unit.calcAtkStat() * Boss.bossDmgReduction * critMulti //1.9 is the crit multiplier, make it a global
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

func dmgToBoss(_ Unit1: Unit, _ Unit2: Unit, _ Unit3: Unit, _ Boss: Boss) -> Int{
    var unit1Dmg = Unit1.dmgPerUnit(Unit1, Boss)
    var unit2Dmg = Unit2.dmgPerUnit(Unit2, Boss)
    var unit3Dmg = Unit3.dmgPerUnit(Unit3, Boss)
    return (unit1Dmg + unit2Dmg + unit3Dmg)
}

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
    if Int(remainingHp) > 0 {
        print("You did \(formattedRotationDmg) this turn! \(Boss.bossName)'s health is now \(formattedRemainingHp)")
    }
    else{
        print("You did \(formattedRotationDmg) this turn! \(Boss.bossName)'s  health is now 0!")
    }
    var formattedPercentDealt = String(format: "%.2f", percentDealt)
    var formattedPercentRemaining = String(format: "%.2f", percentRemaining)
    var rotationsNeeded = Int(ceil(percentRemaining / percentDealt))
    if rotationsNeeded == 0{ //this if else if else handles grammar also a satisfying note if you one shot it.
        print("You one shot the boss!")
    }
    else if rotationsNeeded == 1{
        print("You did \(formattedPercentDealt)%  of the boss's hp this turn! The boss has \(formattedPercentRemaining)% remaining. \(rotationsNeeded) more turn like that and you win!")
    }
    else{
        print("You did \(formattedPercentDealt)%  of the boss's hp this turn! The boss has \(formattedPercentRemaining)% remaining. \(rotationsNeeded) more turns like that and you win!")
    }
}


//bellow @MainActor was added by playgrounds as a "fix" on my return
func typeCalc(_ Unit: Unit, _ Boss: Boss) -> (Float, Float){ //if the unit's dictionary value is the boss's type we get advantage, if the boss's dictionary matches the unit's we get disadvantage anything else returns neutral. It is a weird sort of rock paper scissors
    var currentCalcForType = "Type"
    let typeAdvantages: [String: String] = ["Agl": "Str", "Str": "Phy", "Phy": "Int", "Int": "Teq", "Teq": "Agl"]

    if Unit.unitType == Boss.bossType {
        currentCalcForType = "Neutral"
    } else if typeAdvantages[Unit.unitType] == Boss.bossType { //if the dictionary value of the unit's type matches the boss' type that gives advantage
        currentCalcForType = "Advantage"
    } else if typeAdvantages[Boss.bossType] == Unit.unitType { //if the dictionary value of the boss's type is the unit's type it gets advantage
        currentCalcForType = "Disadvantage"
    } else {
        currentCalcForType = "Neutral" //same type and non advantage/disadvantage returns neutral
    }
    
    //part two of the calc below
    var guardMulti: Float = 1.0
    var typeMulti: Float = 1.0
    
    if (currentCalcForType == "Neutral" && Unit.unitClass != Boss.bossClass){
        typeMulti = 1.15
        guardMulti = 1.0
    }
    if (currentCalcForType == "Neutral" && Unit.unitClass == Boss.bossClass){
        typeMulti = 1.0
        guardMulti = 1.0
    }
    if (currentCalcForType == "Advantage" && Unit.unitClass != Boss.bossClass){
        typeMulti = 1.0
        guardMulti = 0.5
    }
    if (currentCalcForType == "Advantage" && Unit.unitClass == Boss.bossClass){
        typeMulti = 0.9
        guardMulti = 0.5
    }
    if (currentCalcForType == "Disadvantage" && Unit.unitClass != Boss.bossClass){
        typeMulti = 1.5
        guardMulti = 1.0
    }
    if (currentCalcForType == "Disadvantage" && Unit.unitClass == Boss.bossClass){
        typeMulti = 1.25
        guardMulti = 1.0
    }
    return(typeMulti, guardMulti)
}



func dmgTakenNormalBeforeAttacking(_ Unit: Unit, _ Boss: Boss)-> Int{
    var bossVariance: Float = 1.015
    let typeMulti: Float
    let guardMulti: Float
    if Unit.hasGuard == true{
        typeMulti = 0.8
        guardMulti = 0.5
    }
    else{
        (typeMulti, guardMulti) = typeCalc(Unit, Boss)
    }
    var unitDefense = Unit.calcDefStatBeforeAtk()
    var damageTaken = (Boss.bossDmg * bossVariance * typeMulti * guardMulti * (1 - Unit.unitDmgRed)) - unitDefense
    damageTaken = dropDecimal(damageTaken)
    if damageTaken < 0 {
        damageTaken = 100
    }
    return Int(damageTaken)
//    print(damageTaken) //to test
}
func dmgTakenSuperBeforeAttacking(_ Unit: Unit, _ Boss: Boss)-> Int{
    var bossVariance: Float = 1.015
    let typeMulti: Float
    let guardMulti: Float
    if Unit.hasGuard == true{
        typeMulti = 0.8
        guardMulti = 0.5
    }
    else{
        (typeMulti, guardMulti) = typeCalc(Unit, Boss)
    }
    var unitDefense = Unit.calcDefStatBeforeAtk()
    var damageTaken = (Boss.bossDmgSuper * bossVariance * typeMulti * guardMulti * (1 - Unit.unitDmgRed)) - unitDefense
    damageTaken = dropDecimal(damageTaken)
    if damageTaken < 0 {
        damageTaken = 100
    }
    return Int(damageTaken)
//    print(damageTaken) //to test
}
func dmgTakenNormalAfterAttacking(_ Unit: Unit, _ Boss: Boss)-> Int{
    var bossVariance: Float = 1.015
    let typeMulti: Float
    let guardMulti: Float
    if Unit.hasGuard == true{
        typeMulti = 0.8
        guardMulti = 0.5
    }
    else{
        (typeMulti, guardMulti) = typeCalc(Unit, Boss)
    }
    var unitDefense = Unit.calcDefStatAfterAtk()
    var damageTaken = (Boss.bossDmg * bossVariance * typeMulti * guardMulti * (1 - Unit.unitDmgRed)) - unitDefense
    damageTaken = dropDecimal(damageTaken)
    if damageTaken < 0 {
        damageTaken = 100
    }
    return Int(damageTaken)
//    print(damageTaken) //to test
}
func dmgTakenSuperAfterAttacking(_ Unit: Unit, _ Boss: Boss)-> Int{
    var bossVariance: Float = 1.015
    let typeMulti: Float
    let guardMulti: Float
    if Unit.hasGuard == true{
        typeMulti = 0.8
        guardMulti = 0.5
    }
    else{
        (typeMulti, guardMulti) = typeCalc(Unit, Boss)
    }
    var unitDefense = Unit.calcDefStatAfterAtk()
    var damageTaken = (Boss.bossDmgSuper * bossVariance * typeMulti * guardMulti * (1 - Unit.unitDmgRed)) - unitDefense
    damageTaken = dropDecimal(damageTaken)
    if damageTaken < 0 {
        damageTaken = 100
    }
    return Int(damageTaken)
//    print(damageTaken) //to test
}

func turnCalc(_ UnitSlotOne: Unit,_ UnitSlotTwo: Unit,_ UnitSlotThree: Unit,_ Boss: Boss){
    var CurrentBossHp = Int(Boss.bossHp)
    var CurrentPlayerHp = 700000
    while (CurrentBossHp != 0) || (CurrentPlayerHp != 0){
        var numberOfAttacks = 0
        var superAtk = Int.random(in: 0..<5)
        var attackPlacement = [Int]()
        while numberOfAttacks < 10{
            var attack = Int.random(in: 1..<5)
            attackPlacement.append(attack)
            numberOfAttacks += 1
        }
        var damageTaken = 0
        for attack in attackPlacement{
            if attack == 1{
                damageTaken += dmgTakenNormalBeforeAttacking(UnitSlotOne, Boss)
            }
            else if attack == 2{
                damageTaken += dmgTakenNormalAfterAttacking(UnitSlotOne, Boss)
            }
            else if attack == 3{
                damageTaken += dmgTakenNormalAfterAttacking(UnitSlotTwo, Boss)
            }
            else if attack == 4{
                damageTaken += dmgTakenNormalAfterAttacking(UnitSlotThree, Boss)
            }
        }
        if superAtk == 0{
            print("No super attack taken this turn!")
        }
        else if superAtk == 1{
            damageTaken += dmgTakenSuperBeforeAttacking(UnitSlotOne, Boss)
        }
        else if superAtk == 2{
            damageTaken += dmgTakenSuperAfterAttacking(UnitSlotOne, Boss)
        }
        else if superAtk == 3{
            damageTaken += dmgTakenSuperAfterAttacking(UnitSlotTwo, Boss)
        }
        else if superAtk == 4{
            damageTaken += dmgTakenSuperAfterAttacking(UnitSlotThree, Boss)
        }
        
        var dmgDealtToBoss = dmgToBoss(UnitSlotOne, UnitSlotTwo, UnitSlotThree, Boss)
        CurrentPlayerHp -= damageTaken
        CurrentBossHp -= dmgDealtToBoss
        if CurrentBossHp < 0{
            CurrentBossHp = 0
            print("You defeated \(Boss.bossName)")
            break
        }
        else if CurrentPlayerHp < 0{
            CurrentPlayerHp = 0
            print("You took \(damageTaken) damage. You were defeated")
            break
        }
        else{
            print("You took \(damageTaken) damage this turn your hp is now \(CurrentPlayerHp). You dealt \(dmgDealtToBoss) damage the boss's hp is now \(CurrentBossHp)")
        }
    }
}
//
//dmgPerRotation(vegito, goku, gotenks, kidBuu)
//
//dmgVsBoss(vegito, kidBuu)
////this will be a function to calculate different units vs different bosses

//dmgVsBoss(vegito, kidBuu)
// this shows the function with a different unit and boss

//dmgVsBoss(fauxUnit, fauxBoss)
//
//dmgPerRotation(fauxUnit, vegito, gotenks, fauxBoss)
//dmgPerRotation(fauxUnit, goku, gotenks, kidBuu)
//dmgPerRotation(vegito, goku, gotenks, fauxBoss)

//vegito.calcAtkStat()
//vegito.calcDefStat()
//print(formatNumbers(Int(gogeta.calcAtkStat())))
//gogeta.calcDefStatAfterAtk()
//print(formatNumbers(Int(vegito.calcAtkStat())))
//typeCalc(gogeta, kidBuu)
//dmgTakenNormalBeforeAttacking(gogeta, kidBuu)
turnCalc(goku, vegito, gogeta, kidBuu)
