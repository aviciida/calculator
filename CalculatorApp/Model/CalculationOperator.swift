//
//  CalculationOperator.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/10/04.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

enum CalculationOperator: String {
    case devide = "÷"
    case multiply = "×"
    case plus = "+"
    case minus = "-"
    
    init?(text: String) {
        if text == CalculationOperator.devide.rawValue{
            self = .devide
        } else if text == CalculationOperator.multiply.rawValue {
            self = .multiply
        } else if text == CalculationOperator.plus.rawValue {
            self = .plus
        } else if text == CalculationOperator.minus.rawValue {
            self = .minus
        } else {
            return nil
        }
    }
}
