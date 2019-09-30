//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by 飯田諒 on 2019/09/29.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppTests: XCTestCase {

    func testCalculationsPopNumberOpen() {
        let op = Calculations.popNumber(isOpen: true,
                                        prevNumber: "234",
                                        inputNumber: "55")
        XCTAssertEqual(op.displayNumber, "23")
        XCTAssertEqual(op.inputNumber, "55")
        XCTAssertEqual(op.prevNumber, "23")
    }
    
    func testCalculationsPopNumberNotOpen() {
        let op = Calculations.popNumber(isOpen: false,
                                        prevNumber: "234",
                                        inputNumber: "55")
        XCTAssertEqual(op.displayNumber, "5")
        XCTAssertEqual(op.inputNumber, "5")
        XCTAssertEqual(op.prevNumber, "234")
    }
    
    func testCalculationsJudgeAvailabilityToAppend() {
        XCTAssertFalse(Calculations.judgeAvailabilityToAppend(senderTag: 0, prevNumber: ""))
        XCTAssertFalse(Calculations.judgeAvailabilityToAppend(senderTag: 0, prevNumber: "0"))
        XCTAssertFalse(Calculations.judgeAvailabilityToAppend(senderTag: 1, prevNumber: ""))
        XCTAssertTrue(Calculations.judgeAvailabilityToAppend(senderTag: 1, prevNumber: "0"))
        
    }
    
    func testAddNumberUnableToAppendNumber() {
        let op = Calculations.addNumber(senderTag: 0, isOpen: false, isCalculated: false, prevNumber: "", processPrevNumber: "34", processInputNumber: "44", processTotalNumber: "55", inputNumber: "9", isAbleToAppendNumber: false)
        XCTAssertEqual(op.newPrevNumber, "")
        XCTAssertEqual(op., <#T##expression2: Equatable##Equatable#>)
    }
    

}
