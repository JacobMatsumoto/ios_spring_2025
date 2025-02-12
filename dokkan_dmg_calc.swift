
import UIKit

//I want to make a small damage calculator for a game I play

var characterAtkStat = 19975.0
var leaderSkill = 5.40 //(440 percent all percents for simplicity will be done like this)
var passiveSkill = 3.0
var links = 1.55 //15,15,5,20,10,15
var items = 1.0 //I dont use them often but need it here so it'll be one doing nothing in multiplication
var kiMultiplier = 2.0 //can change depending on ki this assumes 24 (max)
var passiveSkillMultiplicative = 3.0
var superAtkMultiplier = 5.2 + 0.35 + 0.5  //or 3.95 for first number on 12 ki super
//I haven't tried making a calc for this game before so my formula could be off
var finalDmg = characterAtkStat * leaderSkill * passiveSkill * links * kiMultiplier * items * passiveSkillMultiplicative * superAtkMultiplier

print(finalDmg)
// The game drops decimals in calcs for dmg I'm not sure how to do that in swift yet so the numbers are slightly higher than they should be. This took way longer than expected mostly from mathing it out in game rather than the coding part. The attack stat in game was 18,207,064 a difference of only 8 so thats impressive for this.
