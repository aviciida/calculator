//
//  CalculatorAppCalculatorTests.swift
//  CalculatorAppTests
//
//  Created by 飯田諒 on 2019/10/06.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp

class CalculatorAppCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testCalculate() {
        let numbers = ["32", "45"]
        let operators = [CalculationOperator.plus]
        let result = Calculator.calculate(numbers, operators: operators)
        XCTAssertEqual(result, "77")
        
        let numbers1 = ["32", "45", "2"]
        let operators1 = [CalculationOperator.plus, CalculationOperator.multiply]
        let result1 = Calculator.calculate(numbers1, operators: operators1)
        XCTAssertEqual(result1, "154")
        
        let numbers2 = ["32", "45", "2"]
        let operators2 = [CalculationOperator.plus, CalculationOperator.multiply, CalculationOperator.minus]
        let result2 = Calculator.calculate(numbers2, operators: operators2)
        XCTAssertEqual(result2, "154")
        
        let numbers3 = ["32", "45", "2", "0.4"]
        let operators3 = [CalculationOperator.plus, CalculationOperator.multiply, CalculationOperator.devide]
        let result3 = Calculator.calculate(numbers3, operators: operators3)
        XCTAssertEqual(result3, "385")
        
        let numbers4 = ["3"]
        let operators4 = [CalculationOperator.plus]
        let result4 = Calculator.calculate(numbers4, operators: operators4)
        XCTAssertEqual(result4, "3")
        
        let numbers5 = ["3", "5"]
        let operators5 = [CalculationOperator.multiply]
        let result5 = Calculator.calculate(numbers5, operators: operators5)
        XCTAssertEqual(result5, "15")
        
        let numbers6 = ["3", "0"]
        let operators6 = [CalculationOperator.devide]
        let result6 = Calculator.calculate(numbers6, operators: operators6)
        XCTAssertEqual(result6, "ゼロで割らないで")
        
        let numbers7 = [""]
        let operators7 = [CalculationOperator.multiply]
        let result7 = Calculator.calculate(numbers7, operators: operators7)
        XCTAssertEqual(result7, "0")
        
        let numbers8 = ["0"]
        let operators8 = [CalculationOperator.multiply]
        let result8 = Calculator.calculate(numbers8, operators: operators8)
        XCTAssertEqual(result8, "0")
        
    }

}
