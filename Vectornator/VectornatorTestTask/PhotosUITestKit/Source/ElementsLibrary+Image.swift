//
//  ElementsLibrary+Image.swift
//  PhotosUITestKit
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation

extension ElementsLibrary {

    public enum Image: ElementsLibraryPageElementsIdentifierShared {
        case mainScrollView
        case deleteButton
        case deletePhotoButton
        case allPhotosBackButton

        public var identifier: String {
            switch self {
            case .mainScrollView:
                return "OneUpMainPagingView"
            case .deleteButton:
                return "Delete"
            case .deletePhotoButton:
                return "Delete Photo"
            case .allPhotosBackButton:
                return "All Photos"
            }
        }
    }
}


