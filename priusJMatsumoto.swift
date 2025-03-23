import UIKit

class Prius {
    var tires: String = "Tires"
    var engine: String = "Engine"
    var windowTint: Int = 20
    var mirrors: String = "Mirrors"
    var operationType: String = "Operation"
    var radio: String = "Radio"
    
    func printCarBuild() -> String {
        
        return "You ordered a prius with \(self.tires) tires, a \(self.engine) engine, a nice \(self.windowTint)% window tint, a pair of \(self.mirrors) mirrors, \(self.operationType) for operation type, and lastly a \(self.radio) for the radio"
    }//this function returns a string for printing out the details of the car
    
}

var myCar = Prius()

myCar.tires = "Off-Road"
myCar.engine = "V8"
myCar.windowTint = 0
myCar.mirrors = "Electric"
myCar.operationType = "Manual"
myCar.radio = "Custom touch-screen"


print(myCar.printCarBuild())
