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
        XCTAssertEqual(viewModel.displayNumberLabelText, "239")
        XCTAssertEqual(viewModel.prevNumber, "899")
        XCTAssertEqual(viewModel.processPrevNumber, "899")
        XCTAssertEqual(viewModel.processNumberLabelText, "899239")
        XCTAssertEqual(viewModel.inputNumber, "239")
        XCTAssertEqual(viewModel.processInputNumber, "239")
    }
    
    func testViewModelCalculationNotUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = false
        viewModel.prevNumber = "38"
        viewModel.processPrevNumber = "38"
        
        viewModel.calculation(senderTag: 12)
        XCTAssertEqual(viewModel.processPrevNumber, "38×")
        XCTAssertEqual(viewModel.processNumberLabelText, "38×")
    }
    
    func testViewModelCalculationUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = true
        viewModel.prevNumber = "38"
        viewModel.processPrevNumber = "38"
        viewModel.inputNumber = "91"
        viewModel.processInputNumber = "91"
        
        viewModel.calculation(senderTag: 12)
        XCTAssertEqual(viewModel.processPrevNumber, "")
    }

    func testInitialLabelTextValue() {
        let viewModel = CalculatorViewModel()
        var value: String? = nil
        viewModel.displayNumberHandler = { newValue in
            value = newValue
        }
        XCTAssertEqual(value, "0")
        
        viewModel.displayNumberLabelText = "15"
        var value1: String? = nil
        viewModel.displayNumberHandler = { newValue in
            value1 = newValue
        }
        XCTAssertEqual(value1, "15")
        
        var value2: String? = nil
        viewModel.processNumberHandler = { newValue in
            value2 = newValue
        }
        XCTAssertEqual(value2, "0")
        
        viewModel.processNumberLabelText = "21"
        var value3 : String? = nil
        viewModel.processNumberHandler = { newValue in
            value3 = newValue
        }
        XCTAssertEqual(value3, "21")
    }
    

}
