//
//  BandTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class BandTests: WASTest {
	
	func testWithBandsJSON() {
		let json = self.listJSON
		let list = json["bands"]
		let bands = Band.arrayFromJson(list)
		let expected = 10
		XCTAssertEqual(bands.count, expected, "The bands count should be equal to \(expected).")
	}
	
	func testWithBandsJSONFail() {
		let bands = Band.arrayFromJson(self.invalidJSON)
		let expected = 0
		XCTAssertEqual(bands.count, expected, "The bands count should be equal to \(expected).")
	}
	
	func testWithBandDetailJSONFail() {
		let band = Band(json: self.invalidJSON)
		XCTAssertNil(band, "The band should be nil.")
	}
	
}
