//
//  URLTests.swift
//  wasband
//
//  Created by Wagner Sales on 30/11/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import XCTest
@testable import wasband
import SwiftyJSON

class URLTests: WASTest {
	
	func testBandDetailUrl() {
		let expectation = self.expectation(description: #function)
		let band = self.band
		let urlString = URL.WASbandById(band.id)
		let url = URL(string: urlString)!
		let session = URLSession.shared
		let task = session.dataTask(with: url) { data, response, error in
			XCTAssertNotNil(data, "data should not be nil")
			XCTAssertNil(error, "error should be nil")
			
			if let HTTPResponse = response as? HTTPURLResponse,
				let responseURL = HTTPResponse.url,
				let MIMEType = HTTPResponse.mimeType {
				XCTAssertEqual(responseURL.absoluteString, url.absoluteString, "HTTP response URL should be equal to original URL")
				XCTAssertEqual(HTTPResponse.statusCode, 200, "HTTP response status code should be 200")
				XCTAssertEqual(MIMEType, "application/json", "HTTP response content type should be application/json")
			} else {
				XCTFail("Response was not NSHTTPURLResponse")
			}
			
			do {
				let jsonSerialized = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
				if let json = jsonSerialized as? [String : AnyObject] {
					XCTAssertNotNil(json["name"], "Response data name should be not nil")
					XCTAssertNotNil(json["genre"], "Response data genre should be not nil")
					XCTAssertNotNil(json["image"], "Response data image should be not nil")
					XCTAssertNotNil(json["country"], "Response data country should be not")
					XCTAssertNotNil(json["country_flag"], "Response data country_flag should be not nil")
					XCTAssertNotNil(json["website"], "Response data website should be not nil")
				} else {
					XCTFail("Response data was not right structure")
				}
				
			} catch {
				XCTFail("Data can be not serialized")
			}
			
			expectation.fulfill()
		}
		
		task.resume()
		
		waitForExpectations(timeout: task.originalRequest!.timeoutInterval) { error in
			if let error = error {
				print("Error: \(error.localizedDescription)")
			}
			task.cancel()
		}
	}
}
