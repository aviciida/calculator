//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/09/30.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

class CalculatorViewModel {
    var processNumberLabelText = "" {
        didSet {
            processNumberHandler?(processNumberLabelText)
        }
    }
    var displayNumberLabelText = "" {
        didSet {
            displayNumberHandler?(displayNumberLabelText)
        }
    }
    
    var processNumberHandler: ((String) -> Void)? = nil
    var displayNumberHandler: ((String) -> Void)? = nil
    
    var processPrevNumber: String = ""
    var processInputNumber: String = ""
    var processTotalNumber: String = ""
    var prevNumber: String = ""
    var inputNumber: String = ""
    var resultNumber: Int = 0
    var isOpen: Bool = true
    var isCalculated: Bool = false
    var operation: OperationType = .add
//    var isAbleToAppendNumbers:((Int, String) -> Bool) = { senderTag, prevNumberText in
//        if senderTag > 0 {
//            return true
//        } else if senderTag == 0 && prevNumberText.count > 0 {
//            return true
//        } else {
//            return false
//        }
//    }
    
    func popNumber() {
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
        prevNumber = newPrevNumber
        inputNumber = newInputNumber
        displayNumberLabelText = newDisplayNumber
    }
    
    func appendNumber(senderTag: Int) {
        let isAbleToAppendNumbers = senderTag > 0 || senderTag == 0 && prevNumber.count > 0
        let newPrevNumber: String
        let newDisplayNumber: String
        let newProcessPrevNumber: String
        let newProcessInputNumber: String
        let newInputNumber: String
        let newProcessNumber: String
        if !isAbleToAppendNumbers {
            newPrevNumber = prevNumber
            newDisplayNumber = "0"
            newProcessPrevNumber = processPrevNumber
            newProcessInputNumber = processInputNumber
            newInputNumber = inputNumber
            newProcessNumber = "0"
            
            displayNumberLabelText = newDisplayNumber
            prevNumber = newPrevNumber
            processPrevNumber = newProcessPrevNumber
            processNumberLabelText = newProcessNumber
            inputNumber = newInputNumber
            processInputNumber = newProcessInputNumber
            
            return
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
        displayNumberLabelText = newDisplayNumber
        prevNumber = newPrevNumber
        processPrevNumber = newProcessPrevNumber
        processNumberLabelText = newProcessNumber
        inputNumber = newInputNumber
        processInputNumber = newProcessInputNumber
    }
    
    func calculation(senderTag: Int) {
        guard let op = OperationType.init(rawValue: senderTag) else { return }
        operation = op
        let calculationMark = operation.calculationMark()
        
        if isOpen {
            isOpen = false
            processPrevNumber += calculationMark
            processNumberLabelText = processPrevNumber
        } else {
            processTotalNumber += calculationMark
            processNumberLabelText = processTotalNumber
            if let prev = Int(prevNumber), let input = Int(inputNumber) {
                resultNumber = operation.calculate(m: prev, n: input)
//                process()
            }
        }
    }
    
    
}
