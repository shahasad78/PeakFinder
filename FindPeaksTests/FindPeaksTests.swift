//
//  FindPeaksTests.swift
//  FindPeaksTests
//
//  Created by Richard Martinez on 5/13/16.
//  Copyright © 2016 PhantomUniversalMediaProductions. All rights reserved.
//

import XCTest
@testable import FindPeaks

class FindPeaksTests: XCTestCase {


    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGenericPeakFinderWithInts() {
        let array1 = [1,2,1,2,1,3,2,4,3,3,2,4,5,6,5,6,7,8,9,10,9,7,8,9,9,9,11,15,12,13,10,100,90,10,80,90,100,110,130,110,200,220,210,100,150,90,1000,900,800,540,220,115,100,900,910]
        var results1: [Int] = []
        self.measureBlock {
            results1 = array1.findPeaks()
        }
        XCTAssert(results1 == [2,2,3,4,6,10,15,13,100,130,220,150,1000], "Test failed: Error finding peaks using generic algorithm")
    }

    func testGenericPeakFinderWithStrings() {
        let array = ["apple", "bob", "apple", "apple", "cat", "bob", "apple", "door","cat"]
        var results1: [String] = []
        self.measureBlock {
            results1 = array.findPeaks()
        }
        XCTAssert(results1 == ["bob", "cat", "door"], "Test Failed: Error finding peaks on String arrays using generic algorithm")
    }


    func testPeaksByTwos() {
        var results2: [Int] = []
        self.measureBlock {
            results2 = findPeaksByTwos([1,2,1,2,1,3,2,4,3,3,2,4,5,6,5,6,7,8,9,10,9,7,8,9,9,9,11,15,12,13,10,100,90,10,80,90,100,110,130,110,200,220,210,100,150,90,1000,900,800,540,220,115,100,900,910])
        }
        print(results2)
        XCTAssert(results2 == [2,2,3,4,6,10,15,13,100,130,220,150,1000], "Test Failed: Error finding peaks using peaksByTwos")
    }

    func testPeaksByOnes() {
        var results3: [Int] = []
        self.measureBlock{
            results3 = findPeaksByOnes([1,2,1,2,1,3,2,4,3,3,2,4,5,6,5,6,7,8,9,10,9,7,8,9,9,9,11,15,12,13,10,100,90,10,80,90,100,110,130,110,200,220,210,100,150,90,1000,900,800,540,220,115,100,900,910])
        }
        print(results3)
        XCTAssert(results3 == [2,2,3,4,6,10,15,13,100,130,220,150,1000], "Test Failed: Error finding peaks using peaksByOnes")
    }
}
