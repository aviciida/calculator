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
        XCTAssertEqual(op.displayNumber, "234")
        XCTAssertEqual(op.inputNumber, "5")
        XCTAssertEqual(op.prevNumber, "234")
    }
    
    func testCalculationsPopNumberNotOpen() {
        let op = Calculations.popNumber(isOpen: false,
                                        prevNumber: "",
                                        inputNumber: "55")
        XCTAssertEqual(op.displayNumber, "5")
        XCTAssertEqual(op.inputNumber, "5")
        XCTAssertEqual(op.prevNumber, "")
    }
    
}
