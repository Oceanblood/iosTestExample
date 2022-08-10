//
//  ImageScope.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import PhotosUITestKit
import XCTest

extension ElementsLibrary.Image: ElementsLibraryPage {
    public var element: XCUIElement {
        switch self {
        case .mainScrollView:
            return photosApp.scrollViews[identifier]
        case .deleteButton:
            return photosApp.buttons[identifier]
        case .deletePhotoButton:
            return photosApp.scrollViews.buttons[identifier]
        case .allPhotosBackButton:
            return photosApp.buttons[identifier]
        }
    }

    public var elements: [XCUIElement] {
        return []
    }
}

struct ImageScope: Scope {

    typealias Library = ElementsLibrary.Image

    let test: PhotosTestCase

    static func checkPage() -> Bool {
        Library.mainScrollView.element.exists
    }

    @discardableResult func tapOnDelete() -> ImageScope {
        logAndScreen {
            Library.deleteButton.element.tap()
        }
        return self
    }

    @discardableResult func tapOnDeletePhoto() -> ImageScope {
        logAndScreen {
            Library.deletePhotoButton.element.tap()
        }
        return self
    }

    @discardableResult func tapOnBackToAllPhotos() -> ImageScope {
        logAndScreen {
            Library.allPhotosBackButton.element.tap()
        }
        return self
    }
}

