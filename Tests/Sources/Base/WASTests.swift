//
//  WASTest.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband
import SwiftyJSON

class WASTest: XCTestCase {
	
	var listJSON: JSON {
		let bundle = Bundle(for: WASTest.self)
		let filePath = bundle.path(forResource: "list", ofType: "json")
		let data = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
		let json = JSON(data: data!)
		return json
	}
	
	var invalidJSON: JSON {
		return JSON([:])
	}
	
	var band: Band {
		let json = self.listJSON
		let list = json["bands"].arrayValue
		let band = list.first!
		return Band(json: band)!
	}
}
