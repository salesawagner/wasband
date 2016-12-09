//
//  URL+WASURL.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import Foundation

//**************************************************************************************************
//
// MARK: - extension
//
//**************************************************************************************************

extension URL {

	//**************************************************
	// MARK: - Properties
	//**************************************************
	
	static var WASbaseUrl: String {
		return "https://powerful-oasis-33182.herokuapp.com/"
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
	
	static func WASbandById(_ id: String) -> String {
		var url = self.WASbaseUrl
		url += "bands/\(id)"
		return url
	}
	
	//**************************************************
	// MARK: - Override Public Methods
	//**************************************************
	
}
