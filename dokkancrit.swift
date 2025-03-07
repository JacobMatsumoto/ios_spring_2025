import UIKit

func dmgCalc() {
    var characterAtkStat = 19975.0
    var leaderSkill = 5.40
    var passiveSkill = 3.0
    var links = 1.70 //5,15,15,15,20
    var items = 1.0
    var kiMultiplier = 2.0
    var passiveSkillMultiplicative = 3.0
    var superAtkMultiplier = 5.2 + 0.35 + 0.5  //or 3.95 for first number on 12 ki super
    var bossDef = 650000.0
    var bossDmgReduction = 0.75
    var variance = 1.010
    //variance is a small mechanic that multiplies dmg between 1 and 1.03. however due to my inability to drop decimals properly, I will be putting it in a lower end of its middle ground to account for error
    
    var finalAtkStat = characterAtkStat * leaderSkill * passiveSkill * links * kiMultiplier * items * passiveSkillMultiplicative * superAtkMultiplier
    var finalDmg = finalAtkStat * variance
    var finalDmgPostDef = finalDmg - bossDef
    var finalDmgPostBossStats = Int((Double(finalDmgPostDef) * 1.5) * (1.0 - bossDmgReduction))
    //the 1.5 is for super effective against all types
    print(String(finalDmgPostBossStats) + " " + "Non-crit dmg")
    //with variance this is an acceptable number
    var critDmgTotal = critDmg(Double(finalDmg))
    print(String(critDmgTotal) + " " + "Crit dmg")
    
}
var critDmg = { finalDmg in
    return finalDmg * 1.9 * 0.25

}

dmgCalc()
