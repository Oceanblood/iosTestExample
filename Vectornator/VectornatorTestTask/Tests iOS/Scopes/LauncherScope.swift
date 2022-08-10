//
//  LauncherScope.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import XCTest

// Launcher is a special Scope, which could be used in setup or in test to launch app with arguments, reset,
// terminate, relaunch

struct LauncherScope: Scope {

    typealias Library = GlobalElementsLibrary

    let test: PhotosTestCase

    static func checkPage() -> Bool {
        return true
    }

    @discardableResult func launchAppAndSkipOnboarding() -> LauncherScope {
        logAndScreen {
            photosApp.launch()
            skipOnboardingIfNeeded()
        }
        return self
    }

    // Note: This func could also be added to OnboardingScope in future

    @discardableResult func skipOnboardingIfNeeded() -> String {
        if photosApp.buttons["Continue"].isVisible {
            photosApp.buttons["Continue"].tap()
        }
        else {
            return "No Onboardng shown"
        }
        return "Onboarding skipped"
    }
}
