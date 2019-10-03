//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Shun Usami on 2019/10/03.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import Foundation

/// ViewModel for CalculatorViewController
///
/// Will be renamed to CalculatorViewModel.
class NewCalculatorViewModel {
    private var resultText = "0" {
        didSet {
            mainLabelTextHandler?(resultText)
        }
    }
    private var rawText = "0" {
        didSet {
            subLabelTextHandler?(rawText)
        }
    }
    
    // MARK: - Output
    /// Handler which is called when main label text is changed
    ///
    /// ```
    /// // Set handler
    /// viewModel.mainLabelTextHandler = { [weak self] resultText in
    ///     self?.mainLabel.text = resultText
    /// }
    /// ```
    var mainLabelTextHandler: ((String) -> Void)? = nil {
        didSet {
            mainLabelTextHandler?(resultText)
        }
    }
    /// Handler which is called when sub label text is changed
    ///
    /// ```
    /// // Set handler
    /// viewModel.subLabelTextHandler = { [weak self] rawText in
    ///     self?.subLabel.text = rawText
    /// }
    /// ```
    var subLabelTextHandler: ((String) -> Void)? = nil {
        didSet {
            subLabelTextHandler?(rawText)
        }
    }

    // MARK: - Input
    /// Input numbers, operators or dot as a String
    func input(_ text: String?) {
        guard let text = text, let calculatorInput = CalculatorInput(text) else { return }
        if calculatorInput.isAppendableTo(rawText: rawText) {
            rawText += text
        }
        updateResult()
    }

    /// Input that delete button is tapped
    func didTapDelete() {
        // TODO: delete
        updateResult()
    }
    
    /// Input that clear button is tapped
    func didTapClear() {
        // TODO: clear
        updateResult()
    }
    
    // MARK: private functions
    private func updateResult() {
        let (numbers, operators) = CalculationParser.parse(rawText)
        resultText = Calculator.calculate(numbers: numbers, operators: operators)
    }
}
