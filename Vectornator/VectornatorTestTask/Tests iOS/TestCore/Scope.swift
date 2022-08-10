//
//  Scope.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation
import XCTest

/// Protocol represents how our Steps should look like
///
public protocol Scope {
    
    associatedtype Library: ElementsLibraryPage
    
    var test: PhotosTestCase { get }
    
    static func checkPage() -> Bool

    func logAndScreen(functionName: String, block: () throws -> Void) rethrows

}


public extension Scope {

    /// This method allows us to check Scope and retry in used func + make a screenshot
    ///
    func logAndScreen(functionName: String = #function, block: () throws -> Void) rethrows {
        guard !test.data.finished else {
            return
        }

        XCTAssert(Self.isThisScopeWithRetry(), "Couldn't check scope \(self)")

        try XCTContext.runActivity(named: functionName) { _ in
            try block()
            test.saveScreenshot(withName: functionName)
        }
    }
}

///  An extension which allows us to verify is it current Scope page or not
///
public extension Scope {
    
    static func isThisScopeWithRetry() -> Bool {
        for _ in 0 ..< 10 {
            if checkPage() {
                return true
            }
            sleep(1)
        }
        
        return false
    }
    
    static func checkScopeWithRetry() {
        XCTAssert(isThisScopeWithRetry(), "We aren't in scope \(Self.self)")
    }
}

