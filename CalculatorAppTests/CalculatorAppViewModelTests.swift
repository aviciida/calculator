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

    func testViewModelPopNumberNotUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = false
        viewModel.prevNumber = "1234"
        viewModel.inputNumber = "567"
        viewModel.popNumber()
        XCTAssertEqual(viewModel.displayNumberLabelText, "123")
        XCTAssertEqual(viewModel.prevNumber, "123")
        XCTAssertEqual(viewModel.inputNumber, "567")
    }
    
    func testViewModelPopNumberUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = true
        viewModel.prevNumber = "1234"
        viewModel.inputNumber = "567"
        viewModel.popNumber()
        
        XCTAssertEqual(viewModel.displayNumberLabelText, "56")
        XCTAssertEqual(viewModel.prevNumber, "1234")
        XCTAssertEqual(viewModel.inputNumber, "56")
        
    }
    
    func testViewModelAppendNumbersUnable() {
        let viewModel = CalculatorViewModel()
        viewModel.isAbleToAppendNumbers = false
        viewModel.processPrevNumber = "10"
        viewModel.processInputNumber = "23"
        viewModel.inputNumber = "74"
        
        viewModel.appendNumber(senderTag: 0)
        XCTAssertEqual(viewModel.displayNumberLabelText, "0")
        XCTAssertEqual(viewModel.processPrevNumber, "10")
        XCTAssertEqual(viewModel.processNumberLabelText, "0")
        XCTAssertEqual(viewModel.inputNumber, "74")
        XCTAssertEqual(viewModel.processInputNumber, "23")
        
    }
    
    func testViewModelAppendNumbersNotUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isAbleToAppendNumbers = true
        viewModel.isUnderCalculation = false
        viewModel.prevNumber = "89"
        viewModel.processPrevNumber = "89"
        
        viewModel.appendNumber(senderTag: 9)
        XCTAssertEqual(viewModel.displayNumberLabelText, "899", "prevNumberにsenderTagが足される")
        XCTAssertEqual(viewModel.prevNumber, "899")
        XCTAssertEqual(viewModel.processPrevNumber, "899")
        XCTAssertEqual(viewModel.processNumberLabelText, "899")
        XCTAssertEqual(viewModel.inputNumber, "")
        XCTAssertEqual(viewModel.processInputNumber, "")
    }
    
    func testViewModelAppendNumbersUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isAbleToAppendNumbers = true
        viewModel.isUnderCalculation = true
        viewModel.prevNumber = "899"
        viewModel.processPrevNumber = "899"
        viewModel.processInputNumber = "23"
        viewModel.inputNumber = "23"
        viewModel.processTotalNumber = "899"
        
        viewModel.appendNumber(senderTag: 9)
        XCTAssertEqual(viewModel.displayNumberLabelText, "239", "inputNumberにsenderTagが足される")
        XCTAssertEqual(viewModel.prevNumber, "899")
        XCTAssertEqual(viewModel.processPrevNumber, "899")
        XCTAssertEqual(viewModel.processNumberLabelText, "899239")
        XCTAssertEqual(viewModel.inputNumber, "239")
        XCTAssertEqual(viewModel.processInputNumber, "239")
    }

}
