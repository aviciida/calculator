//
//  Calculator.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/10/04.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

/// Implement calculation with given numbers and operators
struct Calculator {
    /// Input numbers as String and operators as CalculationOperator and returns result text as String
    static func calculate(_ numbers: [String], operators: [CalculationOperator]) -> String {
        guard let firstNumber = numbers.first, var resultNumber = Float(firstNumber) else { return "0" }
        let leftNumbers: [Float] = Array(numbers.dropFirst()).map { Float($0) ?? 0 }
        let arrayCount: Int = leftNumbers.count >= operators.count ? leftNumbers.count : operators.count // get the higher number
        for i in 0...arrayCount {
            guard operators.count > i && leftNumbers.count > i else { break } // Prevent index out of range to happen
            let op = operators[i]
            if let resultFloat = Float(op.calculate(resultNumber, leftNumbers[i])) {
                resultNumber = resultFloat
            } else {
                return "ゼロで割らないで"
            }
        }
        var resultString = String(resultNumber)
        if resultString.last == "0" {
            resultString = String(resultString.dropLast().dropLast())
        }
        return resultString
    }
}
