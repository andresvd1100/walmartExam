//
//  Excersice2Tests.swift
//  Excersice2Tests
//
//  Created by Andres Valerio on 11/10/24.
//

import XCTest
@testable import Excersice2

final class Excersice2Tests: XCTestCase {
    private var sut: Excersice1!
    
    override func setUp()  {
        super.setUp()
        sut = Excersice1()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testExampleOnlyEvens() throws {
        //Given
        var arrayOne = [2,4,6,8,10]
        let expectedSumOne = 30
        //When
        let sum = sut.sumEven(array: arrayOne)
        //Then
        XCTAssertEqual(expectedSumOne, sum)
    }

    func testExampleEmptyArray() throws {
        //Given
        var arrayOne: [Int] = []
        let expectedSumOne = 0
        //When
        let sum = sut.sumEven(array: arrayOne)
        //Then
        XCTAssertEqual(expectedSumOne, sum)
    }
    
    func testExampleOddArray() throws {
        //Given
        var arrayOne = [1,3,5,7,9,11]
        let expectedSumOne = 0
        //When
        let sum = sut.sumEven(array: arrayOne)
        //Then
        XCTAssertEqual(expectedSumOne, sum)
    }
    
    func testExampleNormalArray() throws {
        //Given
        var arrayOne = [1,2,3,4,5,6,17,12,34,56,90,10,5,46]
        let expectedSumOne = (2 + 4 + 6 + 12 + 34 + 56 + 90 + 10 + 46)
        //When
        let sum = sut.sumEven(array: arrayOne)
        //Then
        XCTAssertEqual(expectedSumOne, sum)
    }

}
