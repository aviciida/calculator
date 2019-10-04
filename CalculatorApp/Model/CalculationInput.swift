//
//  CalculationInput.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/10/04.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

enum CalculationInput {
    case dot
    case `operator`
    case number
    
    init?(text: String?) {
        guard let inputText = text else { return nil }
        
        
        
    }
    
    func canAppendTo(rawText: String) -> Bool {
        // TODO: implement here.
        // inputのタイプによって、rawTextの最後が何の場合はokで何の場合はngかあるので、それでswitch してケース分けする（ex: .dotの場合は、演算子/ドットじゃなければok）

        return false
    }
}
