//
//  CalculatorAppOperatorTests.swift
//  CalculatorAppTests
//
//  Created by 飯田諒 on 2019/10/05.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppOperatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testInit() {
        let op1 = CalculationOperator.init(text: "+")
        XCTAssertTrue(op1 == .some(.plus))
        
        let op2 = CalculationOperator.init(text: "-")
        XCTAssertTrue(op2 == .some(.minus))
        
        let op3 = CalculationOperator.init(text: "×")
        XCTAssertTrue(op3 == .some(.multiply))
        
        let op4 = CalculationOperator.init(text: "÷")
        XCTAssertTrue(op4 == .some(.devide))
        
        let op5 = CalculationOperator.init(text: "0")
        XCTAssertTrue(op5 == nil)
        
        let op6 = CalculationOperator.init(text: "9")
        XCTAssertTrue(op6 == nil)

        let op7 = CalculationOperator.init(text: "あ")
        XCTAssertTrue(op7 == nil)

        
    }

}
