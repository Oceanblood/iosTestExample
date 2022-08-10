//
//  Optional+Utils.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/9/22.
//

import Foundation
import XCTest

public extension Optional {

    /// This methods could be used when you need to unwrap results of functions
    ///
    func unwrapOrFail(returnBlock: @autoclosure () -> Wrapped, message: String) -> Wrapped {
        guard self != nil else {
            XCTFail(message)
            return returnBlock()
        }
        return unsafelyUnwrapped
    }
}

public extension Optional where Wrapped == String {

    func unwrapOrFail(_ message: String = "Unwrap failed") -> Wrapped {
        unwrapOrFail(returnBlock: Wrapped(), message: message)
    }
}
