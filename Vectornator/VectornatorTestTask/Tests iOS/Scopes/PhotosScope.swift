//
//  PhotosScope.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/9/22.
//

import PhotosUITestKit
import XCTest

extension ElementsLibrary.Photos: ElementsLibraryPage {
    public var element: XCUIElement {
        switch self {
        case .collectionView:
            return photosApp.collectionViews[identifier]
        case .photoCells:
            return photosApp.cells.firstMatch
        case .deleteButton:
            return photosApp.buttons[identifier]
        case .deleteFromLibraryButton:
            return photosApp.cells.buttons[identifier]
        }
    }

    public var elements: [XCUIElement] {
        return []
    }
}

struct PhotosScope: Scope {

    typealias Library = ElementsLibrary.Photos

    let test: PhotosTestCase

    static func checkPage() -> Bool {
        Library.collectionView.element.exists
    }

    func getFirstPhotoTextLabel() -> String {
        var photoTextLabel: String?
        logAndScreen {
            photoTextLabel = Library.photoCells.element.firstMatch.label
        }
        return photoTextLabel.unwrapOrFail()
    }

    @discardableResult func pressOnFirstPhoto() -> PhotosScope {
        logAndScreen {
            Library.photoCells.element.firstMatch.press(forDuration: 2)
        }
        return self
    }

    @discardableResult func tapOnFirstPhoto() -> PhotosScope {
        logAndScreen {
            Library.photoCells.element.firstMatch.tap()
        }
        return self
    }

    @discardableResult func tapOnDelete() -> PhotosScope {
        logAndScreen {
            Library.deleteButton.element.tap()
        }
        return self
    }

    @discardableResult func tapOnDeletePhotoFromLibrary() -> PhotosScope {
        logAndScreen {
            Library.deleteFromLibraryButton.element.tap()
        }
        return self
    }
}
