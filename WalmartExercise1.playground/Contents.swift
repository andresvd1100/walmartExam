import UIKit

var greeting = "Hello, playground"


func sumEven(array: [Int]) -> Int {
    var sum: Int = 0
    for number in array {
        sum = (number % 2 == 0) ? sum + number : sum
    }
    return sum
}


var myArray: [Int] = [1,2]
print("\(sumEven(array: myArray))")
