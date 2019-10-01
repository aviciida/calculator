//
//  CalculatorAppViewModelTests.swift
//  CalculatorAppTests
//
//  Created by 飯田諒 on 2019/10/01.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppViewModelTests: XCTestCase {
    
    func testViewModelJudgeAbilityToAppendNumbers() {
        let viewModel = CalculatorViewModel()
        viewModel.prevNumber = ""
        viewModel.judgeAbilityToAppendNumbers(senderTag: 0)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, false)
        
        viewModel.prevNumber = "1"
        viewModel.judgeAbilityToAppendNumbers(senderTag: 0)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, true)
        
        viewModel.prevNumber = ""
        viewModel.judgeAbilityToAppendNumbers(senderTag: 1)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, true)
        
        viewModel.prevNumber = "1"
        viewModel.judgeAbilityToAppendNumbers(senderTag: 1)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, true)
    }

    func testViewModelPopNumberOpen() {
        let viewModel = CalculatorViewModel()
        viewModel.isOpen = true
        viewModel.prevNumber = "1234"
        viewModel.inputNumber = "567"
        viewModel.popNumber()
        XCTAssertEqual(viewModel.displayNumberLabelText, "123")
        XCTAssertEqual(viewModel.prevNumber, "123")
        XCTAssertEqual(viewModel.inputNumber, "567")
    }
    
    func testViewModelPopNumberNotOpen() {
        let viewModel = CalculatorViewModel()
        viewModel.isOpen = false
        viewModel.prevNumber = "1234"
        viewModel.inputNumber = "567"
        viewModel.popNumber()
        
        XCTAssertEqual(viewModel.displayNumberLabelText, "56")
        XCTAssertEqual(viewModel.prevNumber, "1234")
        XCTAssertEqual(viewModel.inputNumber, "56")
        
    }
    
    

}
