//
//  GlobalScope.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation
import XCTest

/// It's a Scope which could be used on every screen of the app as extension
///
public struct GlobalElementsLibrary: ElementsLibraryPage {
    
    public var element: XCUIElement
    public var identifier = ""
    public var elements: [XCUIElement] = []
}

public struct GlobalScope: Scope {
    
    public typealias Library = GlobalElementsLibrary
    
    public let test: PhotosTestCase
    
    public static func checkPage() -> Bool {
        return true
    }
    
    public init(test: PhotosTestCase) {
        self.test = test
    }
}

