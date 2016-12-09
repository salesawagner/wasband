//
//  WASTest.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband

class WASViewControllerTests: WASTest {
	
	var storyboard: UIStoryboard {
		let bundle = Bundle(for: wasband.ListViewController)
		return UIStoryboard(name: "Main", bundle: bundle)
	}
	
	func preloadView(viewController: UIViewController) {
		UIApplication.shared.keyWindow!.rootViewController = viewController
		if let wasViewController = viewController as? WASViewController {
			wasViewController.preloadView()
		}
	}
}
