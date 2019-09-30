//
//  Calculations.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/09/29.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

struct Calculations {
    static func popNumber(isOpen: Bool,
                          prevNumber: String,
                          inputNumber: String)
        -> (prevNumber: String,
        inputNumber: String,
        displayNumber: String){
            let newPrevNumber: String
            let newInputNumber: String
            let newDisplayNumber: String
            if isOpen {
                newPrevNumber = String(prevNumber.dropLast())
                newDisplayNumber = newPrevNumber
                newInputNumber = inputNumber
            } else {
                newInputNumber = String(inputNumber.dropLast())
                newDisplayNumber = newInputNumber
                newPrevNumber = prevNumber
            }
            return (newPrevNumber, newInputNumber, newDisplayNumber)
            
    }
}
