//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/09/30.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Developing new VM called NewCalculatorViewModel")
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
    
    @available(*, deprecated, renamed: "isCalculating")
    var isUnderCalculation: Bool {
        get { return isCalculating }
        set { isCalculating = newValue }
    }
    var isCalculating: Bool = false
    var operation: OperationType = .add
    var isAbleToAppendNumbers = false
    
    func popNumber() {
        if !isCalculating {
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
        if !isCalculating {
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
            if !isCalculating {
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
            if !isCalculating {
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
        if isCalculating { calculate() }
        isAbleToAppendNumbers = false
        guard let result = OperationType.init(rawValue: senderTag) else { return }
        operation = result
        let calculationMark = operation.calculationMark()
        
        if !isCalculating {
            isCalculating = true
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
    
    @available(*, deprecated, renamed: "didTapShowResult")
    func showResultDidTap() {
        didTapShowResult()
    }
    
    func didTapShowResult() {
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
        isCalculating = false
        displayNumberLabelText = "0"
        processNumberLabelText = "0"
    }
    
    func calculate() {
        if let prev = Int(prevNumber), let input = Int(inputNumber) {
            resultNumber = operation.calculate(m: prev, n: input)
        }
    }
    
    
    
}
