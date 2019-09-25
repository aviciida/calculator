//
//  Calculations.swift
//  CalculatorApp
//
//  Created by Shun Usami on 2019/09/25.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation


struct Calculations {
    var processPrevNumber: String = ""
    var processInputNumber: String = ""
    var processTotalNumber: String = ""
    var prevNumber: String = ""
    var inputNumber: String = ""
    var resultNumber: Int = 0
    var isOpen: Bool = true
    var isCalculated: Bool = false
    var operation: Operation = .add

    // Input: isOpen, prevNumber, inputNumber
    // Output: newPrevNumber, newInputNumber, newDisplayNumber
    static func popNumber(isOpen: Bool,
                   prevNumber: String,
                   inputNumber: String)
        -> (prevNumber: String,
            inputNumber: String,
            displayNumber: String) {
                
        let newPrevNumber: String
        let newInputNumber: String
        let newDisplayNumber: String
        if isOpen == true {
            newPrevNumber = String(prevNumber.dropLast())
            newInputNumber = inputNumber
            newDisplayNumber = newPrevNumber
        } else {
            newPrevNumber = prevNumber
            newInputNumber = String(inputNumber.dropLast())
            newDisplayNumber = newInputNumber
        }
                
        return (newPrevNumber, newInputNumber, newDisplayNumber)
    }
}
