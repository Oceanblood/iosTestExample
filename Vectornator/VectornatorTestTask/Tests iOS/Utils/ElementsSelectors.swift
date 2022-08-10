//
//  ElementsSelectors.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation
import XCTest

// Here we have extensions from native XCTest framework

public extension XCUIElement {

    /// this is combined XCTest methods witch existed methods exists & isHittable
    ///
    var isVisible: Bool {
        return exists && isHittable
    }
}
