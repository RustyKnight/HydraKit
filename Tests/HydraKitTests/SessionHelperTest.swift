//
//  SessionHelperTest.swift
//  HydraKit-iOS Tests
//
//  Created by Shane Whitehead on 22/9/17.
//  Copyright © 2017 HydraKit. All rights reserved.
//

import XCTest
import HydraKit
import Hydra

class SessionHelperTest: XCTestCase {
	
	override func setUp() {
		super.setUp()
	}
	
	override func tearDown() {
		super.tearDown()
	}
	
	func testThatCanGet() {
		let exp = expectation(description: "get")
		let url: URL = URL(string: "https://api.thetvdb.com/languages")!
		URLSessionHelper.shared.get(from: url).then { (data) in
			guard let text: String = String(data: data, encoding: .utf8) else {
				XCTFail("Unable to decode data")
				return
			}
			print(text)
			exp.fulfill()
			}.catch { (error) -> (Void) in
				XCTFail("\(error)")
		}
		
		waitForExpectations(timeout: 60.0) { (error) in
			guard let error = error else {
				return
			}
			XCTFail("\(error)")
		}
	}
	
	func testThatCanPost() {
		let exp = expectation(description: "get")
		let url: URL = URL(string: "https://api.thetvdb.com/login")!
		let headers: [String:String] = [
			"Content-Type": "application/json",
			"Accept": "application/json",
			]
		let text = "{\"apikey\":\"super secret\"}"
		print("text = \(text)")
		guard let data = text.data(using: .utf8) else {
			XCTFail("Could not encode body text")
			return
		}
		
		URLSessionHelper.shared.post(to: url, body: data, headers: headers).then { (data) in
			guard let text: String = String(data: data, encoding: .utf8) else {
				XCTFail("Unable to decode data")
				return
			}
			print(text)
			exp.fulfill()
			}.catch { (error) -> (Void) in
				XCTFail("\(error)")
		}
		
		waitForExpectations(timeout: 60.0) { (error) in
			guard let error = error else {
				return
			}
			XCTFail("\(error)")
		}
	}
}
