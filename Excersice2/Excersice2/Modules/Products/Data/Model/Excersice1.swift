//
//  Excersice1.swift
//  Excersice2
//
//  Created by Andres Valerio on 12/10/24.
//

import Foundation

class Excersice1 {
    
    func sumEven(array: [Int]) -> Int {
        var sum: Int = 0
        for number in array {
            sum = (number % 2 == 0) ? sum + number : sum
        }
        return sum
    }
    
}
