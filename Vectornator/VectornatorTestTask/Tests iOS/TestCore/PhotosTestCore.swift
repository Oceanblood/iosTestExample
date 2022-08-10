//
//  PhotosTestCore.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation
import XCTest

public let app = XCUIApplication()
public let photosApp = XCUIApplication(bundleIdentifier: "com.apple.mobileslideshow")

open class PhotosTestCase: XCTestCase {

    /// func which Set up the app with arguments, configuration etc
    ///
    open override func setUp() {
        super.setUp()

        continueAfterFailure = false
    }

    /// saves and  make a screenshot after each step
    ///
    open func saveScreenshot(withName name: String) {

        let fullName = "\(description)_\(name)"
        let preparedName = fullName
            .replacingOccurrences(of: "[", with: "")
            .replacingOccurrences(of: "]", with: "")
            .replacingOccurrences(of: " ", with: "_")
        + "_\(data.lastScreenshotIndex)"

        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = preparedName
        attachment.lifetime = .deleteOnSuccess
        add(attachment)

        data.lastScreenshotIndex += 1
    }
}
