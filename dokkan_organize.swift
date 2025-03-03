import UIKit

let characters = ["SSJ Goku": (19988, 19975, 15088), "SS4 Goku & Vegeta": (22088, 22185, 14725), "God Goku": (18288, 21805, 15575), "God Goku & Vegeta": (20075, 21075, 14869), "UI Goku": (22350, 20700, 17225), "Beast Gohan": (21475, 20675, 17594), "SS2 Gohan": (19113, 18380, 10594), "Angel Vegeta": (18688, 17700, 13756), "SS3 Gotenks": (17838, 17360, 13006), "SS3 Goku GT": (18900, 16935, 13006)]
//stat 1 is hp. stat 2 is atk . stat 3 is def.

//print(characters["Vegito"] as Any) test
var sorted_hp = characters.sorted { $0.value.0 > $1.value.0 }
var sorted_atk = characters.sorted { $0.value.1 > $1.value.1 }
var sorted_def = characters.sorted { $0.value.2 > $1.value.2 }
print(sorted_hp)
print(sorted_atk)
print(sorted_def)
var added_hp = 0
var added_atk = 0
var added_def = 0
var average_hp = 0
var average_atk = 0
var average_def = 0
var total_characters = 0
for (name, value) in characters {
    added_hp += value.0
    added_atk += value.1
    added_def += value.2
    total_characters += 1
    average_hp = added_hp / total_characters
    average_atk = added_atk / total_characters
    average_def = added_def / total_characters
}
print(sorted_hp)
print(sorted_atk)
print(sorted_def)
print(average_hp)
print(average_atk)
print(average_def)

