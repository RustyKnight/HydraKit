//
//  TestAfter.swift
//  HydraKit-iOS Tests
//
//  Created by Shane Whitehead on 22/9/17.
//  Copyright © 2017 HydraKit. All rights reserved.
//

import XCTest
import HydraKit
import Hydra

class TestAfter: XCTestCase {
	
	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
		super.tearDown()
	}

	func testThatAfterWillDelay() {
		let exp = expectation(description: "get")

		let startedAt: Date = Date()
		after(interval: 10.0).then {
			let elapsed = Date().timeIntervalSince(startedAt)
			guard elapsed >= 10.0 else {
				XCTFail("Expected to wait 10 seconds, actually waited for \(elapsed)")
				return
			}
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
