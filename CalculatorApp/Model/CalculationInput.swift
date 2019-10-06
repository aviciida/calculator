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
        // TODO: implement here.
        // inputのタイプによって、rawTextの最後が何の場合はokで何の場合はngかあるので、それでswitch してケース分けする（ex: .dotの場合は、演算子/ドットじゃなければok）

        return false
    }
}
