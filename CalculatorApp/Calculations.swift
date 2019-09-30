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
    
    static func judgeAvailabilityToAppend(senderTag: Int,
                                          prevNumber: String) -> Bool {
        return senderTag > 0 && prevNumber.count > 0
    }
    
    static func addNumber(senderTag: Int,
                          isOpen: Bool,
                          isCalculated: Bool,
                          prevNumber: String,
                          processPrevNumber: String,
                          processInputNumber: String,
                          processTotalNumber: String,
                          inputNumber: String,
                          isAbleToAppendNumber: Bool)
        ->
        (newPrevNumber: String,
        newDisplayNumber: String,
        newProcessPrevNumber: String,
        newProcessInputNumber: String,
        newInputNumber: String,
        newProcessNumber: String) {
            
            let newPrevNumber: String
            let newDisplayNumber: String
            let newProcessPrevNumber: String
            let newProcessInputNumber: String
            let newInputNumber: String
            let newProcessNumber: String
            if !isAbleToAppendNumber {
                newPrevNumber = prevNumber
                newDisplayNumber = "0"
                newProcessPrevNumber = processPrevNumber
                newProcessInputNumber = processInputNumber
                newInputNumber = inputNumber
                newProcessNumber = "0"
                return (newPrevNumber, newDisplayNumber, newProcessPrevNumber, newProcessInputNumber, newInputNumber, newProcessNumber)
            }
            
            if isOpen {
                newPrevNumber = prevNumber + String(senderTag)
                newDisplayNumber = newPrevNumber
                newProcessPrevNumber = newPrevNumber
                newProcessInputNumber = processInputNumber
                newInputNumber = inputNumber
                newProcessNumber = newProcessPrevNumber
            } else {
                newInputNumber = String(senderTag)
                newDisplayNumber = newInputNumber
                newPrevNumber = prevNumber
                newProcessInputNumber = newInputNumber
                newProcessPrevNumber = processPrevNumber
                newProcessNumber = isCalculated ? (processTotalNumber + processInputNumber) : (processTotalNumber + processInputNumber)
            }
            
            return (newPrevNumber, newDisplayNumber, newProcessPrevNumber, newProcessInputNumber, newInputNumber, newProcessNumber)
    }
}
