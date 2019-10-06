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
        
        return (numbers: ["23", "3"], operators: [CalculationOperator.devide])
    }
}
