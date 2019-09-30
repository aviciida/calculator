//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Shun Usami on 2019/09/30.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

class CalculatorViewModel {
    var processNumberLabelText: String = "" {
        didSet {
            processNumberLabelTextHandler?(processNumberLabelText)
        }
    }
    var displayNumberLabelText: String = "" {
        didSet {
            displayNumberLabelTextHandler?(displayNumberLabelText)
        }
    }

    var processNumberLabelTextHandler: ((String) -> Void)?
    var displayNumberLabelTextHandler: ((String) -> Void)?
}
