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
        viewModel.mainLabelTextHandler?("23")
        viewModel.subLabelTextHandler?("23")
        // When
        viewModel.input("+")
        // Then
        XCTAssertEqual(rawTextLabel, "23+")
        XCTAssertEqual(resultTextLabel, "23")
        
        // Given
        viewModel.mainLabelTextHandler?("20")
        viewModel.subLabelTextHandler?("10+10")
        // When
        viewModel.input("1")
        // Then
        XCTAssertEqual(rawTextLabel, "10+101")
        XCTAssertEqual(resultTextLabel, "111")
        
        // Given
        viewModel.mainLabelTextHandler?("20")
        viewModel.subLabelTextHandler?("10+101+")
        // When
        viewModel.input("1")
        // Then
        XCTAssertEqual(rawTextLabel, "10+101")
        XCTAssertEqual(resultTextLabel, "112")
        
        // Given
        viewModel.mainLabelTextHandler?("100")
        viewModel.subLabelTextHandler?("10×10")
        // When
        viewModel.input("1")
        // Then
        XCTAssertEqual(rawTextLabel, "10×101")
        XCTAssertEqual(resultTextLabel, "1010")
        
        

        // Given
        viewModel.mainLabelTextHandler?("23")
        viewModel.subLabelTextHandler?("23+")
        // When
        viewModel.input("0")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23+")
        
        // Given
        viewModel.mainLabelTextHandler?("23")
        viewModel.subLabelTextHandler?("23+")
        // When
        viewModel.input("+")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23+")
        
        // Given
        viewModel.mainLabelTextHandler?("23")
        viewModel.subLabelTextHandler?("23+")
        // When
        viewModel.input("-")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23-")
        
        // Given
        viewModel.mainLabelTextHandler?("23")
        viewModel.subLabelTextHandler?("23+")
        // When
        viewModel.input("÷")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23÷")
        
        // Given
        viewModel.mainLabelTextHandler?("23")
        viewModel.subLabelTextHandler?("23+")
        // When
        viewModel.input("×")
        // Then
        XCTAssertEqual(resultTextLabel, "23")
        XCTAssertEqual(rawTextLabel, "23×")
        
        
        
        
    }
    
    func testDidTapDelete() {
        // Given
        viewModel.mainLabelTextHandler?("")
        viewModel.subLabelTextHandler?("")
        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        viewModel.mainLabelTextHandler?("2")
        viewModel.subLabelTextHandler?("2")
        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        viewModel.mainLabelTextHandler?("2")
        viewModel.subLabelTextHandler?("2+")
        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "2")
        XCTAssertEqual(rawTextLabel, "2")
        
        // Given
        viewModel.mainLabelTextHandler?("53")
        viewModel.subLabelTextHandler?("21+32")
        // When
        viewModel.didTapDelete()
        // Then
        XCTAssertEqual(resultTextLabel, "24")
        XCTAssertEqual(rawTextLabel, "21+3")
        
        // Given
        viewModel.mainLabelTextHandler?("340")
        viewModel.subLabelTextHandler?("349-9")
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
        viewModel.mainLabelTextHandler?("2")
        viewModel.subLabelTextHandler?("2")
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        viewModel.mainLabelTextHandler?("2")
        viewModel.subLabelTextHandler?("2+")
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        viewModel.mainLabelTextHandler?("53")
        viewModel.subLabelTextHandler?("21+32")
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
        
        // Given
        viewModel.mainLabelTextHandler?("340")
        viewModel.subLabelTextHandler?("349-9")
        // When
        viewModel.didTapClear()
        // Then
        XCTAssertEqual(resultTextLabel, "")
        XCTAssertEqual(rawTextLabel, "")
    }
    
}
