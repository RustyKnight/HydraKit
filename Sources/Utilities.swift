//
//  Utilities.swift
//  HydraKit-iOS
//
//  Created by Shane Whitehead on 22/9/17.
//  Copyright © 2017 HydraKit. All rights reserved.
//

import Foundation
import Hydra

// Cause a specified delay to occur before the next promise in the chain is executed
public func after(interval: TimeInterval) -> Promise<Void> {
	return Promise<Void>(in: .main) { fulfill, fail, _ in
		fulfill(())
		}.defer(interval)
}
