//
//  CalculatorAppTests.swift
//  CalculatorAppTests
//
//  Created by Shun Usami on 2019/09/25.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppTests: XCTestCase {
    func testCalculationsPopNumberOpen() {
        let result = Calculations.popNumber(isOpen: true,
                                            prevNumber: "15",
                                            inputNumber: "30")
        XCTAssertEqual(result.prevNumber, "1")
        XCTAssertEqual(result.inputNumber, "30")
        XCTAssertEqual(result.displayNumber, "1")
    }

    func testCalculationsPopNumberNotOpen() {
        let result = Calculations.popNumber(isOpen: false,
                                            prevNumber: "15",
                                            inputNumber: "30")
        XCTAssertEqual(result.prevNumber, "15")
        XCTAssertEqual(result.inputNumber, "3")
        XCTAssertEqual(result.displayNumber, "3")
    }
}
