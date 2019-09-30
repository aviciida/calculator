//
//  Calculation.swift
//  CalculatorApp_2
//
//  Created by 飯田諒 on 2019/05/08.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

enum OperationType: Int {
    case add = 10
    case minus = 11
    case multiply = 12
    case devide = 13
    
    func calculate(m:Int, n:Int) -> Int {
        switch self {
        case .add:
            return m+n
        case .minus:
            return m - n
        case .multiply:
            return m * n
        @unknown default:
            fatalError()
        }
    }
    
}


