//
//  OperationTests.swift
//  CalculatorAppTests
//
//  Created by Shun Usami on 2019/09/25.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class OperationTests: XCTestCase {
    func testAdd() {
        let op = CalculatorApp.Operation.add
        XCTAssertEqual(op.calc(m: 1, n: 1), 2)
        XCTAssertEqual(op.calc(m: 10, n: 33), 43)
        XCTAssertEqual(op.calc(m: 1, n: -10), -9)
    }
    
    func testSub() {
        // TODO: 後で書く！        let op = CalculatorApp.Operation.add
        let op = CalculatorApp.Operation.minus
        XCTAssertEqual(op.calc(m: 1, n: 1), 0)
        XCTAssertEqual(op.calc(m: 10, n: 33), -23)
        XCTAssertEqual(op.calc(m: -11, n: -10), -1)

    }
    
    func testMul() {
        // TODO: 後で書く！
    }
    
    func testDiv() {
        // TODO: 後で書く！
    }
}
