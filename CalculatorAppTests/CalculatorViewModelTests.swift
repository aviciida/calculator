//
//  CalculatorViewModelTests.swift
//  CalculatorAppTests
//
//  Created by Shun Usami on 2019/09/30.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorViewModelTests: XCTestCase {
    func testPopNumber() {
        let viewModel = CalculatorViewModel()
        viewModel.isOpen = true
        viewModel.prevNumber = "234"
        viewModel.inputNumber = "55"
        
        viewModel.popNumber()
        XCTAssertEqual(viewModel.displayNumberLabelText, "234")
        XCTAssertEqual(viewModel.inputNumber, "5")
        XCTAssertEqual(viewModel.prevNumber, "234")
    }
    
    func testAddNumber() {
        let viewModel = CalculatorViewModel()
        viewModel.isOpen = true
        viewModel.prevNumber = "234"
        viewModel.inputNumber = "55"
        
        viewModel.addNumber(senderTag: 9)
        XCTAssertEqual(viewModel.displayNumberLabelText, "559")
        XCTAssertEqual(viewModel.inputNumber, "559")
        XCTAssertEqual(viewModel.prevNumber, "234")
    }
    
    /*
    func testClear() {
        let viewModel = CalculatorViewModel()
        viewModel.isOpen = true
        viewModel.prevNumber = "234"
        viewModel.inputNumber = "55"
        // ...
        
        // viewModel.clear()

        XCTAssertEqual(viewModel.displayNumberLabelText, "")
        XCTAssertEqual(viewModel.inputNumber, "")
        XCTAssertEqual(viewModel.processNumberLabelText, "")
        // ...
    }
    
    func testSituation1() {
        let viewModel = CalculatorViewModel()
        viewModel.addNumber(senderTag: 1)
        viewModel.addNumber(senderTag: 2)
        viewModel.addNumber(senderTag: 3)
        viewModel.popNumber()
        viewModel.oprator(senderTag: 10)
        viewModel.addNumber(senderTag: 2)
        viewModel.addNumber(senderTag: 3)
        viewModel.addNumber(senderTag: 9)
        viewModel.showResult()
        XCTAssertEqual(viewModel.displayNumberLabelText, "251")
        XCTAssertEqual(viewModel.processNumberLabelText, "12 + 239")
    }
    */

}
