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
    
    func testViewModelJudgeAbilityToAppendNumbersNotUnderCalculation() {
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
    
    func testViewModelJudgeAbilityToAppendNumbersUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = true
        
        viewModel.inputNumber = ""
        viewModel.judgeAbilityToAppendNumbers(senderTag: 0)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, false)
        
        viewModel.inputNumber = "1"
        viewModel.judgeAbilityToAppendNumbers(senderTag: 0)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, true)
        
        viewModel.inputNumber = ""
        viewModel.judgeAbilityToAppendNumbers(senderTag: 1)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, true)
        
        viewModel.inputNumber = "1"
        viewModel.judgeAbilityToAppendNumbers(senderTag: 1)
        XCTAssertEqual(viewModel.isAbleToAppendNumbers, true)
    }

    func testViewModelPopNumberNotUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = false
        viewModel.prevNumber = "1234"
        viewModel.processPrevNumber = "1234"
        viewModel.inputNumber = "567"
        viewModel.popNumber()
        XCTAssertEqual(viewModel.displayNumberLabelText, "123")
        XCTAssertEqual(viewModel.prevNumber, "123")
        XCTAssertEqual(viewModel.processPrevNumber, "123")
        XCTAssertEqual(viewModel.processNumberLabelText, "123")
        XCTAssertEqual(viewModel.inputNumber, "567")
    }
    
    func testViewModelPopNumberUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = true
        viewModel.prevNumber = "1234"
        viewModel.processPrevNumber = "1234"
        viewModel.inputNumber = "567"
        viewModel.processInputNumber = "567"
        viewModel.popNumber()
        
        XCTAssertEqual(viewModel.displayNumberLabelText, "56")
        XCTAssertEqual(viewModel.prevNumber, "1234")
        XCTAssertEqual(viewModel.inputNumber, "56")
        XCTAssertEqual(viewModel.processPrevNumber, "1234")
        XCTAssertEqual(viewModel.processInputNumber, "56")
        XCTAssertEqual(viewModel.processNumberLabelText, "123456")
        
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
        
        viewModel.appendNumber(senderTag: 1)
        XCTAssertEqual(viewModel.displayNumberLabelText, "2391")
        XCTAssertEqual(viewModel.prevNumber, "899")
        XCTAssertEqual(viewModel.processPrevNumber, "899")
        XCTAssertEqual(viewModel.processNumberLabelText, "8992391")
        XCTAssertEqual(viewModel.inputNumber, "2391")
        XCTAssertEqual(viewModel.processInputNumber, "2391")
    }
    
    func testViewModelAppendNumberUnableUnderCalculation() {
        // TODO: Implement here.
    }
    
    func testViewModelCalculationNotUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = false
        viewModel.prevNumber = "38"
        viewModel.processPrevNumber = "38"
        
        viewModel.calculationDidTap(senderTag: 12)
        XCTAssertEqual(viewModel.processPrevNumber, "38×")
        XCTAssertEqual(viewModel.processNumberLabelText, "38×")
    }
    
    func testViewModelCalculationUnderCalculation() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = true
        viewModel.prevNumber = "38"
        viewModel.processPrevNumber = "38＋"
        viewModel.inputNumber = "91"
        viewModel.processInputNumber = "91"
        
        viewModel.calculationDidTap(senderTag: 12) // multiply
        XCTAssertEqual(viewModel.processPrevNumber, "38＋91×")
        
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
    
    func testViewModelCalculationSenderTagNotValid() {
        let viewModel = CalculatorViewModel()
        viewModel.isUnderCalculation = true
        viewModel.prevNumber = "38"
        viewModel.processPrevNumber = "38"
        viewModel.inputNumber = "91"
        viewModel.processInputNumber = "91"
        
        viewModel.calculationDidTap(senderTag: 91)
        XCTAssertEqual(viewModel.processPrevNumber, "38")
        XCTAssertEqual(viewModel.processInputNumber, "91")

    }
    
    func testViewModelShowResultDidTap() {
        let viewModel = CalculatorViewModel()
        viewModel.processPrevNumber = "21*45+"
        viewModel.processInputNumber = "99"
        viewModel.prevNumber = "945"
        viewModel.processInputNumber = "99"
        viewModel.inputNumber = "99"
        viewModel.operation = .add
        viewModel.showResultDidTap()
        
        XCTAssertEqual(viewModel.processPrevNumber, "21*45+99")
        XCTAssertEqual(viewModel.resultNumber, 1044)
        XCTAssertEqual(viewModel.inputNumber, "")
        XCTAssertEqual(viewModel.prevNumber, "1044")
        XCTAssertEqual(viewModel.processInputNumber, "")
        XCTAssertEqual(viewModel.displayNumberLabelText, "1044")
    }

    func testViewModelClearNotUnderCalculation() {
        let viewModel = CalculatorViewModel()
        
    }
}
