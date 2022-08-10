//
//  ElementsLibrary.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation
import XCTest

/// this class represents how our ElementsLibraryPage should look like
///
public protocol ElementsLibraryPageElementsIdentifier {
    
    var identifier: String { get }
}

/// representing how getters block looks like for element on Scopes
///
public protocol ElementsLibraryPageElementsGetters {
    
    var element: XCUIElement { get }
    var elements: [XCUIElement] { get }
}

public typealias ElementsLibraryPage = ElementsLibraryPageElementsIdentifier & ElementsLibraryPageElementsGetters
