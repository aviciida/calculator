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
    
    func calculate(_ firstInt: Float, _ secondInt: Float) -> String {
        // TODO: Implement test for this function!
        switch self {
        case .devide:
            if secondInt == 0 {
                return "ゼロで割らないで"
            } else {
                return String(firstInt/secondInt)
            }
        case .multiply:
            return String(firstInt*secondInt)
        case .plus:
            return String(firstInt+secondInt)
        case .minus:
            return String(firstInt-secondInt)
        }
    }
}
