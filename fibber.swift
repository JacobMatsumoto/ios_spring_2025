import UIKit


func fibber() {
    var num1 = 0
    var num2 = 1
    var fib_seq = [Int]()
    while num1 <= 1000 {
        fib_seq.append(num1)
        fib_seq.append(num2)
        num1 += num2
        num2 += num1
        print(fib_seq)
    }
}
fibber()



