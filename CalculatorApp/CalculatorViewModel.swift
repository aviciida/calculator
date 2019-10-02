//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/09/30.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

class CalculatorViewModel {
    var processNumberLabelText = "0" {
        didSet {
            processNumberHandler?(processNumberLabelText)
        }
    }
    var displayNumberLabelText = "0" {
        didSet {
            displayNumberHandler?(displayNumberLabelText)
        }
    }
    
    var processNumberHandler: ((String) -> Void)? = nil {
        didSet {
            processNumberHandler?(processNumberLabelText)
        }
    }
    var displayNumberHandler: ((String) -> Void)? = nil {
        didSet {
            displayNumberHandler?(displayNumberLabelText)
        }
    }
    
    var processPrevNumber: String = ""
    var processInputNumber: String = ""
    var processTotalNumber: String = ""
    var prevNumber: String = ""
    var inputNumber: String = ""
    var resultNumber: Int = 0
    var isUnderCalculation: Bool = false
    var operation: OperationType = .add
    var isAbleToAppendNumbers = false
    
    func popNumber() {
        let newPrevNumber: String
        let newInputNumber: String
        let newDisplayNumber: String
        let newProcessPrevNumber: String
        let newProcessInputNumber: String
        if !isUnderCalculation {
            newPrevNumber = String(prevNumber.dropLast())
            newProcessPrevNumber = String(processPrevNumber.dropLast())
            newDisplayNumber = newPrevNumber
            newInputNumber = inputNumber
            newProcessInputNumber = processInputNumber
        } else {
            newInputNumber = String(inputNumber.dropLast())
            newProcessPrevNumber = processPrevNumber
            newDisplayNumber = newInputNumber
            newPrevNumber = prevNumber
            newProcessInputNumber = String(processInputNumber.dropLast())
        }
        prevNumber = newPrevNumber
        inputNumber = newInputNumber
        displayNumberLabelText = newDisplayNumber
        processPrevNumber = newProcessPrevNumber
        processInputNumber = newProcessInputNumber
        processNumberLabelText = processPrevNumber + processInputNumber
    }
    
    func judgeAbilityToAppendNumbers(senderTag: Int) {
        if !isUnderCalculation {
            isAbleToAppendNumbers = senderTag > 0 || senderTag == 0 && prevNumber.count > 0
        } else {
            isAbleToAppendNumbers = senderTag > 0 || senderTag == 0 && inputNumber.count > 0
        }
    }
    
    func appendNumber(senderTag: Int) {
        judgeAbilityToAppendNumbers(senderTag: senderTag)
        let newPrevNumber: String
        let newDisplayNumber: String
        let newProcessPrevNumber: String
        let newProcessInputNumber: String
        let newInputNumber: String
        let newProcessNumber: String
        if !isAbleToAppendNumbers && !isUnderCalculation {
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
        } else if !isAbleToAppendNumbers && isUnderCalculation {
            // TODO: Implement here.
        }
        
        if !isUnderCalculation {
            newPrevNumber = prevNumber + String(senderTag)
            newDisplayNumber = newPrevNumber
            newProcessPrevNumber = newPrevNumber
            newProcessInputNumber = processInputNumber
            newInputNumber = inputNumber
            newProcessNumber = newProcessPrevNumber
        } else {
            newInputNumber = inputNumber + String(senderTag)
            newDisplayNumber = newInputNumber
            newPrevNumber = prevNumber
            newProcessInputNumber = newInputNumber
            newProcessPrevNumber = processPrevNumber
            newProcessNumber = newProcessPrevNumber + newProcessInputNumber
        }
        displayNumberLabelText = newDisplayNumber
        prevNumber = newPrevNumber
        processPrevNumber = newProcessPrevNumber
        processNumberLabelText = newProcessNumber
        inputNumber = newInputNumber
        processInputNumber = newProcessInputNumber
    }
    
    func calculationDidTap(senderTag: Int) {
        if isUnderCalculation { calculate() }
        isAbleToAppendNumbers = false
        guard let result = OperationType.init(rawValue: senderTag) else { return }
        operation = result
        let calculationMark = operation.calculationMark()
        
        if !isUnderCalculation {
            isUnderCalculation = true
            processPrevNumber += calculationMark
            processNumberLabelText = processPrevNumber
        } else {
            processPrevNumber = processPrevNumber + processInputNumber + calculationMark
            processInputNumber = ""
            processNumberLabelText = processPrevNumber
            displayNumberLabelText = String(resultNumber)
            prevNumber = String(resultNumber)
            inputNumber = ""
        }
    }
    
    func showResultDidTap() {
        calculate()
        processPrevNumber = processPrevNumber + processInputNumber
        displayNumberLabelText = String(resultNumber)
        prevNumber = String(resultNumber)
        inputNumber = ""
        processNumberLabelText = processPrevNumber
        processInputNumber = ""
    }
    
    func clear() {
        prevNumber = ""
        inputNumber = ""
        resultNumber = 0
        isUnderCalculation = false
        displayNumberLabelText = "0"
        processNumberLabelText = "0"
    }
    
    func calculate() {
        if let prev = Int(prevNumber), let input = Int(inputNumber) {
            resultNumber = operation.calculate(m: prev, n: input)
        }
    }
    
    
    
}
