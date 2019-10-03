//
//  CalculatorInput.swift
//  CalculatorApp
//
//  Created by Shun Usami on 2019/10/03.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

enum CalculatorInput {
    case number(Int)
    case dot
    case `operator`(CalculatorOperator)
        
    init?(_ text: String?) {
        guard let text = text else { return nil }
        if let val = Int(text), val < 10, val >= 0 {
            self = .number(val)
            return
        }
        
        if text == "." {
            self = .dot
            return
        }
        
        if let op = CalculatorOperator(rawValue: text) {
            self = .operator(op)
            return
        }

        return nil
    }
    
    func isAppendableTo(rawText: String) -> Bool {
        // TODO: Implement this!
        return false
    }
}
