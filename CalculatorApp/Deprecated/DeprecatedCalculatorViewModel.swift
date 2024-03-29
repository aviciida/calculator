//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/09/30.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "Developing in NewCalculatorViewModel")
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
        set { isCalculating = newValue}
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
        // もともと0を入れておいて、00になる場合はfalse、そうじゃなければtrueを返す感じで良さそう
        // と思ったけど、そうすると他のところで0をの場合とそうでない場合を分けなきゃいけないので、そのやり方は微妙感があるな
        if senderTag == 0 {
            if !isCalculating {
                isAbleToAppendNumbers = prevNumber != ""
            } else {
                isAbleToAppendNumbers = inputNumber != ""
            }
        } else {
            isAbleToAppendNumbers = true

        }

    }
    
    func appendNumber(senderTag: Int) {
        judgeAbilityToAppendNumbers(senderTag: senderTag)
        if !isAbleToAppendNumbers {
            if !isCalculating {
                prevNumber = String(senderTag)
                displayNumberLabelText = String(senderTag)
                processPrevNumber = prevNumber
                processNumberLabelText = String(senderTag)
            } else {
                processInputNumber = ""
                inputNumber = ""
                processNumberLabelText = processPrevNumber + processInputNumber
            }

        } else {
            if !isCalculating {
                prevNumber = prevNumber == "0" ? String(senderTag) : (prevNumber + String(senderTag))
                displayNumberLabelText = prevNumber
                processPrevNumber = prevNumber
                processNumberLabelText = prevNumber
            } else {
                inputNumber = inputNumber + String(senderTag)
                displayNumberLabelText = inputNumber
                processInputNumber = inputNumber
                processNumberLabelText = processPrevNumber + processInputNumber
            }
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
        processInputNumber = ""
        processPrevNumber = ""
    }
    
    func calculate() {
        if let prev = Int(prevNumber), let input = Int(inputNumber) {
            resultNumber = operation.calculate(m: prev, n: input)
        }
    }
    
    
    
}
