//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Shun Usami on 2019/09/30.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

class CalculatorViewModel {
    // MARK: - Properties for input/output
    var processNumberLabelText: String = "" {
        didSet {
            processNumberLabelTextHandler?(processNumberLabelText)
        }
    }
    var displayNumberLabelText: String = "" {
        didSet {
            displayNumberLabelTextHandler?(displayNumberLabelText)
        }
    }

    var processNumberLabelTextHandler: ((String) -> Void)?
    var displayNumberLabelTextHandler: ((String) -> Void)?
    
    // MARK: - Properties for logic
    var processPrevNumber: String = ""
    var processInputNumber: String = ""
    var processTotalNumber: String = ""
    var prevNumber: String = ""
    var inputNumber: String = ""
    var resultNumber: Int = 0
    var isOpen: Bool = true
    var isCalculated: Bool = false
    var operation: OperationType = .add
    
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

    func addNumber(senderTag: Int) {
        if isOpen == true {
            if senderTag == 0 && prevNumber.count == 0 {
            } else {
                prevNumber += String(senderTag)
                displayNumberLabelText = prevNumber
                processPrevNumber = prevNumber
                processNumberLabelText = processPrevNumber
            }
        } else {
            if senderTag == 0 && inputNumber.count == 0 {
            } else {
                inputNumber += String(senderTag)
                displayNumberLabelText = inputNumber
                processInputNumber = inputNumber
                
                if isCalculated == false {
                processNumberLabelText = processPrevNumber + processInputNumber
                } else {
                    processNumberLabelText = processTotalNumber + processInputNumber
                }
            }
        }
    }

}
