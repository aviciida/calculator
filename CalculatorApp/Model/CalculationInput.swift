//
//  CalculationInput.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/10/04.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

enum CalculationInput: Equatable {
    case dot
    case `operator`(CalculationOperator)
    case number(Int)
    
    init?(text: String?) {
        guard let inputText = text else { return nil }
        
        if inputText == "." {
            self = .dot
        } else if let num = Int(inputText) {
            self = .number(num)
        } else if let op = CalculationOperator.init(text: inputText) {
            self = .operator(op)
        } else {
            return nil
        }
        
    }
    
    func canAppendTo(rawText: String) -> Bool {
        guard rawText.count > 0 || rawText.count == 25 else { return false }
        switch self {
        case .number(1...9):
            return true
        case .number(0):
            let rawTextArray = Array(rawText)
            if rawText == "0" {
                // If it's still at the initial state and get an input 0, false
                return false
            } else if String(rawTextArray.last!) == "0" {
                // If it's 100, true. If it's 12+0, false
                if let _ = CalculationOperator.init(text: String(rawTextArray.dropLast().last!)) {
                    return false
                } else {
                    return true
                }
            } else {
                return true
            }
        case .operator:
            return true
        case .dot:
            return false
        default:
            return false
        }
    }
    
    func shouldReplace(rawText: String) -> Bool {
        guard rawText.count > 0 else { return false }
        switch self {
        case .operator:
            if let _ = CalculationOperator.init(text: String(rawText.last!)) {
                return true
            } else {
                return false
            }
        case .number:
            return rawText == "0" // Replace if rawText is 0 to prevent something like "032"
        @unknown default:
            return false
        }
    }
}
