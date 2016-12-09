//
//  ListViewModelTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class ListViewModelTests: WASTest {
        
	func testInitialization() {
		let viewModel = ListViewModel()
		let cellViewModels = viewModel.cellViewModels
		let detailViewModels = viewModel.detailViewModels
		XCTAssertNotNil(viewModel, "The  list view model should not be nil.")
		XCTAssertNotNil(cellViewModels, "The  cell view models should not be nil.")
		XCTAssertNotNil(detailViewModels, "The  detail view model should not be nil.")
	}
}
