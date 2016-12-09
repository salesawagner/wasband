//
//  BandManager.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//**************************************************************************************************
//
// MARK: - Constants -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Definitions -
//
//**************************************************************************************************

//**************************************************************************************************
//
// MARK: - Class -
//
//**************************************************************************************************

class BandManager: NSObject {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	private static var bandsJSON: JSON? {
		var jsonData: JSON?
		let bundle = Bundle(for: self)
		if let filePath = bundle.path(forResource: "bands", ofType: "json") {
			let url = URL(fileURLWithPath: filePath)
			let data = try? Data(contentsOf: url)
			jsonData = JSON(data: data!)
		}
		return jsonData
	}
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************
	
	class func requestList(completion: @escaping CompletionSuccessBands) {
		if let json = self.bandsJSON {
			let bands = Band.arrayFromJson(json["bands"])
			completion(true, bands)
		} else {
			completion(false, nil)
		}
	}
	
	class func requestById(_ id: String, completion: @escaping CompletionSuccessJson ) -> Request? {
		let url = URL.WASbandById(id)
		return Alamofire.request(url, method: .get).responseJSON { response in
			guard let value = response.result.value else {
					completion(false, nil)
					return
			}
			completion(true, JSON(value))
		}
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
