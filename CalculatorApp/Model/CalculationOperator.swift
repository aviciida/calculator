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
    
    func calculate(_ firstText: String, _ secondText: String) -> String{
        guard let firstInt = Int(firstText), let secondInt = Int(secondText) else { return "0" }
        switch self {
        case .devide:
            return String(firstInt/secondInt)
        case .multiply:
            return String(firstInt*secondInt)
        case .plus:
            return String(firstInt+secondInt)
        case .minus:
            return String(firstInt-secondInt)
        }
    }
}
