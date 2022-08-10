//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/9/22.
//

import XCTest

class DeletePhotoTest: PhotosTestCase {
    
    override func setUp() {
        launcherScope.launchAppAndSkipOnboarding()
    }
    
    func test_Delete_Photo_From_All_Photos_Using_Context_Menu() {
        let firstphotoLabel = photosScope.getFirstPhotoTextLabel()
        photosScope.pressOnFirstPhoto()
            .tapOnDeletePhotoFromLibrary()
            .tapOnDelete()
        let newFirstphotoLabel = photosScope.getFirstPhotoTextLabel()
        XCTAssertNotEqual(firstphotoLabel, newFirstphotoLabel)
    }
    
    func test_Delete_Photo() {
        let firstphotoLabel = photosScope.getFirstPhotoTextLabel()
        photosScope.tapOnFirstPhoto()
        imageScope.tapOnDelete()
            .tapOnDeletePhoto()
            .tapOnBackToAllPhotos()
        let newFirstphotoLabel = photosScope.getFirstPhotoTextLabel()
        XCTAssertNotEqual(firstphotoLabel, newFirstphotoLabel)
    }
}
