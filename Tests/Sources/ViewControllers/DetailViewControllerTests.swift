//
//  DetailViewControllerTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class DetailViewControllerTests: WASViewControllerTests {
	
	var viewController: DetailViewController {
		let indentifier = "DetailViewController"
		let storyboard = self.storyboard
		let viewController = storyboard.instantiateViewController(withIdentifier: indentifier)
		return viewController as! DetailViewController
	}
	
	func testViewViewModel(){
		let viewModel = DetailViewModel(band: self.band)
		let viewController = self.viewController
		viewController.viewModel = viewModel
		self.preloadView(viewController: viewController)
		XCTAssertNotNil(viewController.viewModel, "The view model should be not nil.")
		XCTAssertEqual(viewController.title, viewModel.title, "The view controller and view model title should be equal.")
	}

}
