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
                newInputNumber = inputNumber
                newDisplayNumber = newPrevNumber
                
            } else {
                newInputNumber = String(inputNumber.dropLast())
                newPrevNumber = prevNumber
                newDisplayNumber = newInputNumber
            }
            return (newPrevNumber, newInputNumber, newDisplayNumber)
            
    }
}
