//
//  CalculationParser.swift
//  CalculatorApp
//
//  Created by Shun Usami on 2019/10/03.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

struct CalculationParser {
    static func parse(_ text: String) -> ([String], [CalculatorOperator]){
        var numbers: [String] = []
        var operators: [CalculatorOperator] = []

        var tmp: String = ""
        let inputs = text.map { CalculatorInput(String($0)) }
        
        for i in inputs {
            switch i {
            case .number(let val):
                tmp += "\(val)"
            case .dot:
                tmp += "."
            case .operator(let op):
                operators.append(op)
                numbers.append(tmp)
                tmp = ""
            default:
                assertionFailure("This cannot be happen!")
            }
        }
        
        if !tmp.isEmpty {
            numbers.append(tmp)
        }
        return (numbers, operators)
    }
}
