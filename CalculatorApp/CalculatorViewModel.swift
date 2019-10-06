//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by 飯田諒 on 2019/10/04.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

class NewCalculatorViewModel {
    
    /// String that will be displayed as mainTextLabel
    private var resultText: String = "0" {
        didSet {
            mainLabelTextHandler?(resultText)
        }
    }

    /// String that will be displayed as subTextLabel
    private var rawText: String = "0" {
        didSet {
            subLabelTextHandler?(rawText)
        }
    }
    
    // Mark: - Output
    /// Handler called when subLabelText is changed
    ///
    /// ```
    /// // Set
    /// viewModel.subLabelTextHandler { subLabel in
    ///     self?.subLabel.text = subLabel
    /// }
    /// ```
    var mainLabelTextHandler: ((String) -> Void)? = nil {
        didSet {
            mainLabelTextHandler?(resultText)
        }
    }
    
    /// Handler called when subLabelText is changed
    ///
    /// ```
    /// // Set
    /// viewModel.subLabelTextHandler { subLabel in
    ///     self?.subLabel.text = subLabel
    /// }
    /// ```
    var subLabelTextHandler: ((String) -> Void)? = nil {
        didSet {
            subLabelTextHandler?(rawText)
        }
    }
    
    /// Input numbers, operators, or dots
    func input(_ text: String) {
        if let input = CalculationInput.init(text: text) {
            if input.canAppendTo(rawText: rawText) {
                if input.shouldReplace(rawText: rawText) {
                    rawText = String(rawText.dropLast())
                    rawText += text
                } else {
                    rawText += text
                }
            }
        }
        updateResult()
    }
    
    /// Called when delete button is tapped
    func didTapDelete() {
        if rawText != "0" {
            rawText = String(rawText.dropLast())
        }
        updateResult()
    }
    
    /// Called when clear button is tapped
    func didTapClear() {
        rawText = "0"
        resultText = "0"
        updateResult()
    }
    
    private func updateResult() {
        // implement calculation and update resultLabel
        let parsed = CalculationParser.parse(rawText)
        let result = Calculator.calculate(parsed.numbers, operators: parsed.operators)
        resultText = result
        
    }
}
