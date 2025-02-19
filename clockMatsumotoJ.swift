import UIKit


var seconds = 0
var minutes = 0
var hours = 0
var on = true
while on == true { //I used while true from what i learned in python
    seconds += 1
    var time = String(hours) + ":" + String(minutes) + ":" + String(seconds)
    if seconds == 60 {
        seconds = 0
        minutes += 1
        if minutes == 60 {
            minutes = 0
            hours += 1
            if hours == 24 {
                hours = 0
                on = false
            }
        }
    }
}
//if seconds == 60 {
//    seconds = 0
//    minutes += 1
//    I commented these out because i moved them into the while to get it to work
//}
//if minutes == 60 {
//    minutes = 0
//    hours += 1
//}
//if hours == 24 {
//    hours = 0
//}
//
//var time = String(hours) + ":" + String(minutes) + ":" + String(seconds)
//
//print(time)
