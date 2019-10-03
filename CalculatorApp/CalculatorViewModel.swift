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
        if !isUnderCalculation {
            prevNumber = String(prevNumber.dropLast())
            processPrevNumber = String(processPrevNumber.dropLast())
            displayNumberLabelText = prevNumber
        } else {
            inputNumber = String(inputNumber.dropLast())
            displayNumberLabelText = inputNumber
            processInputNumber = String(processInputNumber.dropLast())
        }
        processNumberLabelText = processPrevNumber + processInputNumber
    }
    
    func judgeAbilityToAppendNumbers(senderTag: Int) {
        if !isUnderCalculation {
            isAbleToAppendNumbers = senderTag > 0 || senderTag == 0 && prevNumber.count > 0
        } else if inputNumber == "" {
            isAbleToAppendNumbers = true
        } else if inputNumber == "0" {
            isAbleToAppendNumbers = false
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
        if !isAbleToAppendNumbers {
            if !isUnderCalculation {
                newPrevNumber = String(senderTag)
                newDisplayNumber = String(senderTag)
                newProcessPrevNumber = newPrevNumber
                newProcessInputNumber = processInputNumber
                newInputNumber = inputNumber
                newProcessNumber = String(senderTag)

            } else {
                newPrevNumber = prevNumber
                newProcessPrevNumber = processPrevNumber
                newProcessInputNumber = String(senderTag)
                newInputNumber = String(senderTag)
                newDisplayNumber = String(senderTag)
                newProcessNumber = newProcessPrevNumber + newProcessInputNumber

            }
            
            displayNumberLabelText = newDisplayNumber
            prevNumber = newPrevNumber
            processPrevNumber = newProcessPrevNumber
            processNumberLabelText = newProcessNumber
            inputNumber = newInputNumber
            processInputNumber = newProcessInputNumber
            
            return

        } else {
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
