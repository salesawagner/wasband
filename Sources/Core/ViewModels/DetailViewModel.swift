//
//  DetailViewModel.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

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
// MARK: - Class - DetailViewModel
//
//**************************************************************************************************

class DetailViewModel: NSObject {
	
	//**************************************************
	// MARK: - Properties
	//**************************************************

	internal var band: Band
	
	var title = L.details
	var name: String
	var genre: String?
	var country: String?
	var website: String?
	var photoUrl: String?

	//**************************************************
	// MARK: - Constructors
	//**************************************************
	
	init(band: Band) {
		self.band = band
		self.name = band.name
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
	
	func loadById(_ completion: @escaping CompletionSuccess) {
		self.band.update { (success) in
			if success {
				self.genre		= self.band.genre
				self.country	= self.band.country
				self.website	= self.band.website
				self.photoUrl	= self.band.photoUrl
			}
			completion(success)
		}
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
