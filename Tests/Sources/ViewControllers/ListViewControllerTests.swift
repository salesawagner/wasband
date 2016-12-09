//
//  ListViewControllerTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class ListViewControllerTests: WASViewControllerTests {
	
	var viewController: ListViewController {
		let indentifier = "ListViewController"
		let storyboard = self.storyboard
		let viewController = storyboard.instantiateViewController(withIdentifier: indentifier)
		return viewController as! ListViewController
	}
	
	func testViewViewModel(){
		let viewModel = ListViewModel()
		let viewController = self.viewController
		self.preloadView(viewController: viewController)
		XCTAssertNotNil(viewController.viewModel, "The view model should be not nil.")
		XCTAssertEqual(viewController.title, viewModel.title, "The view controller and view model title should be equal.")
	}
	
	func testLoadBand(){
		let expectation = self.expectation(description: #function)
		let viewController = self.viewController
		viewController.viewModel = ListViewModel()
		self.preloadView(viewController: viewController)
		viewController.loadBands(completion: { (success) in
			let cellsCount	= viewController.viewModel.cellViewModels.count
			let rowsCount	= viewController.tableView.numberOfRows(inSection: 0)
			XCTAssertEqual(cellsCount, rowsCount, "The rows and cell count should br equal.")
			expectation.fulfill()
		})
		self.waitForExpectations(timeout: 60, handler: nil)
	}

}
