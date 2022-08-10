//
//  ElementsLibrary+Photos.swift
//  PhotosUITestKit
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation

extension ElementsLibrary {

    public enum Photos: ElementsLibraryPageElementsIdentifierShared {
        case collectionView
        case photoCells
        case deleteButton
        case deleteFromLibraryButton

        public var identifier: String {
            switch self {
            case .collectionView:
                return "PhotosGridView"
            // Note: Nil, cuz we don't know cell ID, otherwise here should be a String ID
            case .photoCells:
                return "nil"
            case .deleteButton:
                return "Delete Photo"
            case .deleteFromLibraryButton:
                return "Delete from Library"
            }
        }
    }
}

