//
//  DetailViewModelTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class DetailViewModelTests: WASTest {
	
	func testInitialization() {
		let detailViewModel = DetailViewModel(band: self.band)
		XCTAssertNotNil(detailViewModel, "The detail view model should not be nil.")
	}
	
	func testUpdate() {
		let expectation = self.expectation(description: #function)
		let detailViewModel = DetailViewModel(band: self.band)
		
		detailViewModel.loadById { (success) in
			expectation.fulfill()
			XCTAssert(success, "The success should be true.")
		}
		
		self.waitForExpectations(timeout: 60, handler: nil)
	}
	
	func testUpdateFail() {
		let expectation = self.expectation(description: #function)
		let detailViewModel = DetailViewModel(band: self.band)
		detailViewModel.band.id = ""
		
		detailViewModel.loadById { (success) in
			expectation.fulfill()
			XCTAssert(success == false, "The success should be false.")
		}
		
		self.waitForExpectations(timeout: 60, handler: nil)
	}
}
