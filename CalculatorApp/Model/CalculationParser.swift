//
//  CalculationParser.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/10/04.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

/// Parse rawText provided from VC into numbers and operators
struct CalculationParser {
        
    /// Input text that includes numbers and operators, parse it, and returns an array of numbers as String and an array of operators as CalculationOperator
    static func parse(_ text: String) -> (numbers: [String], operators: [CalculationOperator]) {
        // TODO: Implement here
        var numbers: [String] = []
        var operators: [CalculationOperator] = []
        var tmp = ""
        for c in text {
            if let num = Int(String(c)) {
                tmp += String(num)
            } else if let op = CalculationOperator.init(text: String(c)) {
                operators.append(op)
                numbers.append(tmp)
                tmp = ""
            } else if String(c) == "." {
                tmp += "."
            }
        }
        if !tmp.isEmpty {
            numbers.append(tmp)
        }
        return (numbers: numbers, operators: operators)
    }
}
