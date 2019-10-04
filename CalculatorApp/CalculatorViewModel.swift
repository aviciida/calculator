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
    var mainLabelTextHandler: ((String) -> Void)? = nil
    
    /// Handler called when subLabelText is changed
    ///
    /// ```
    /// // Set
    /// viewModel.subLabelTextHandler { subLabel in
    ///     self?.subLabel.text = subLabel
    /// }
    /// ```
    var subLabelTextHandler: ((String) -> Void)? = nil
    
    /// Input numbers, operators, or dots
    func input(_ text: String) {
        
    }
    
    /// Called when delete button is tapped
    func didTapDelete() {
        
    }
    
    /// Called when clear button is tapped
    func didTapClear() {
    }
    
    
}
