//
//  ColorTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class ColorTests: XCTestCase {
	
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testRedColor() {
		let color = UIColor.WASRedColor().WASColorToUInt()
		XCTAssertNotNil(color, "The color not should be nil")
	}
	
	func testBackgroundColor() {
		let color = UIColor.WASBackgroundColor().WASColorToUInt()
		XCTAssertNotNil(color, "The color not should be nil")
	}
}
