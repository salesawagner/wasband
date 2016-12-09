//
//  Band.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit
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
// MARK: - Class - Band
//
//**************************************************************************************************

class Band: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	// Info
	var id: String
	var name: String
	var genre: String?
	var country: String?
	var website: String?
	var photoUrl: String?
	
	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	init?(json: JSON) {
		guard let id = json["id"].string, !id.isEmpty,
			let name = json["name"].string, !name.isEmpty else {
			return nil
		}
		// Info
		self.id = id
		self.name = name
	}
	
	//**************************************************
	// MARK: - Private Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Internal Methods
	//**************************************************
	
	//**************************************************
	// MARK: - Public Methods
	//**************************************************

	func update(completion: @escaping CompletionSuccess) {
		let _ = BandManager.requestById(self.id) { (success, json) in
			if success, let json = json {
				self.genre		= json["genre"].stringValue
				self.country	= json["country"].stringValue
				self.website	= json["website"].stringValue
				self.photoUrl	= json["image"].stringValue
			}
			completion(success)
		}
	}
	
	class func arrayFromJson(_ json: JSON) -> [Band] {
		var list = [Band]()
		for listJson in json.arrayValue {
			if let band = Band(json: listJson) {
				list.append(band)
			}
		}
		return list
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
