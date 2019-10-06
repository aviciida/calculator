//
//  CalculatorAppCalculationInputTests.swift
//  CalculatorAppTests
//
//  Created by 飯田諒 on 2019/10/06.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp


class CalculatorAppCalculationInputTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testInit() {
        let input = CalculationInput.init(text: nil)
        XCTAssertNil(input)

        let input1 = CalculationInput.init(text: ".")
        XCTAssertEqual(input1, CalculationInput.dot)
        
        let input2 = CalculationInput.init(text: "3")
        XCTAssertEqual(input2, CalculationInput.number(3))
        
        let input3 = CalculationInput.init(text: "0")
        XCTAssertEqual(input3, CalculationInput.number(0))
        
        let input4 = CalculationInput.init(text: "+")
        XCTAssertEqual(input4, CalculationInput.operator(.plus))
        
        let input5 = CalculationInput.init(text: "-")
        XCTAssertEqual(input5, CalculationInput.operator(.minus))
        
        let input6 = CalculationInput.init(text: "×")
        XCTAssertEqual(input6, CalculationInput.operator(.multiply))
        
        let input7 = CalculationInput.init(text: "a")
        XCTAssertEqual(input7, nil)
        
    }
    
    func testCanAppendTo() {
        let input = CalculationInput.number(1)
        XCTAssertEqual(input.canAppendTo(rawText: "0"), true)
        XCTAssertEqual(input.canAppendTo(rawText: "2+"), true)
        
        let input1 = CalculationInput.number(0)
        XCTAssertEqual(input1.canAppendTo(rawText: "0"), false)
        XCTAssertEqual(input1.canAppendTo(rawText: "1"), true)
        XCTAssertEqual(input1.canAppendTo(rawText: "2+"), true)
        XCTAssertEqual(input1.canAppendTo(rawText: "2+0"), false)
        
        let input2 = CalculationInput.operator(.devide)
        XCTAssertEqual(input2.canAppendTo(rawText: ""), false )
        XCTAssertEqual(input2.canAppendTo(rawText: "2"), true )
        XCTAssertEqual(input2.canAppendTo(rawText: "2+"), true )
        
        let input3 = CalculationInput.dot
        XCTAssertEqual(input3.canAppendTo(rawText: "0"), true)
        XCTAssertEqual(input3.canAppendTo(rawText: "0."), false)
        XCTAssertEqual(input3.canAppendTo(rawText: "34"), true)
        XCTAssertEqual(input3.canAppendTo(rawText: "3+"), false)
        XCTAssertEqual(input3.canAppendTo(rawText: "40-0"), true)
        XCTAssertEqual(input3.canAppendTo(rawText: "48-34-3"), true)
        
        
        
    }

}
