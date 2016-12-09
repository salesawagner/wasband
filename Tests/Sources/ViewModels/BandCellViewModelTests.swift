//
//  CellViewModelTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class CellViewModelTests: WASTest {
	
	func testInitialization() {
		let cellViewModel = CellViewModel(band: self.band)
		XCTAssertNotNil(cellViewModel, "The cell view model should not be nil.")
	}
	
}
