//
//  CalculatorAppNewViewModelTests.swift
//  CalculatorAppTests
//
//  Created by 飯田諒 on 2019/10/05.
//  Copyright © 2019 RyoIida. All rights reserved.
//

import XCTest
@testable import CalculatorApp


class CalculatorAppNewViewModelTests: XCTestCase {

    private var viewModel: NewCalculatorViewModel!
    private var resultTextLabel: String!
    private var rawTextLabel: String!
    
    override func setUp() {
        super.setUp()
        resultTextLabel = ""
        rawTextLabel = ""
        viewModel = NewCalculatorViewModel()
        viewModel.mainLabelTextHandler = { [weak self] newResultText in
            self?.resultTextLabel = newResultText
        }
        viewModel.subLabelTextHandler = { [weak self] newRawText in
            self?.rawTextLabel = newRawText
        }
    }
    
    /// Helper function to create preset condition
    func input(_ text: String, to vm: NewCalculatorViewModel) {
        for c in text {
            vm.input(String(c))
        }
    }
    
    func testInitialLabelTextValue() {
        XCTAssertEqual(resultTextLabel, "0") // resultTextが初期値0で設定されている
        XCTAssertEqual(rawTextLabel, "0") // rawTextが初期値0で設定されている
        
    }
    
    func testInput() {
        // When
        viewModel.input("8")
        // Then
        XCTAssertEqual(resultTextLabel, "8")
        XCTAssertEqual(rawTextLabel, "8")
        
        // When
        viewModel.input("0")
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // When
        viewModel.input("=")
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // When
        viewModel.input("+")
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        input("23", to: viewModel)
        // When
        viewModel.input("+")
        // Then
        XCTAssertEqual(rawTextLabel, "23+")
        XCTAssertEqual(resultTextLabel, "23")
        
        // Given
        input("10+10", to: viewModel)
        // When
        viewModel.input("1")
        // Then
        XCTAssertEqual(rawTextLabel, "10+101")
        XCTAssertEqual(resultTextLabel, "111")
        
        // Given
        input("10+101+", to: viewModel)
        // When
        viewModel.input("1")
        // Then
        XCTAssertEqual(rawTextLabel, "10+101")
        XCTAssertEqual(resultTextLabel, "112")
        
        // Given
        input("10×10", to: viewModel)
        // When
        viewModel.input("1")
        // Then
        XCTAssertEqual(rawTextLabel, "10×101")
        XCTAssertEqual(resultTextLabel, "1010")

        // Given
        input("23+", to: viewModel)
        // When
        viewModel.input("0")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23+")
        
        // Given
        input("23+", to: viewModel)
        // When
        viewModel.input("+")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23+")
        
        // Given
        input("23+", to: viewModel)
        // When
        viewModel.input("-")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23-")
        
        // Given
        input("23+", to: viewModel)

        // When
        viewModel.input("÷")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23÷")
        
        // Given
        input("23+", to: viewModel)
        // When
        viewModel.input("×")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23×")
    }
    
    func testDidTapDelete() {
        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        input("2", to: viewModel)

        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        input("2+", to: viewModel)

        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "2")
        XCTAssertEqual(rawTextLabel, "2")
        
        // Given
        input("21+32", to: viewModel)
        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "24")
        XCTAssertEqual(rawTextLabel, "21+3")
        
        // Given
        input("349-9", to: viewModel)
        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "349")
        XCTAssertEqual(rawTextLabel, "349-")

    }
    
    func testDidTapClear() {
        // Given
        viewModel.mainLabelTextHandler?("")
        viewModel.subLabelTextHandler?("")
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        input("2", to: viewModel)
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        input("2+", to: viewModel)

        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        input("23+3+4+", to: viewModel)
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        input("349-9", to: viewModel)
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
    }
    
}
