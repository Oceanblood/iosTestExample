//
//  PhotosTestase+Scopes.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation

/* This class is used as an extension to PrivacyTestCase. When launched, application should know which screen we are
 currently on. We wrap scopes in variables for ease of use in a test environment and provide them to PrivacyTestCore */

extension PhotosTestCase {

    var photosScope: PhotosScope {
        return PhotosScope(test: self)
    }

    var imageScope: ImageScope {
        return ImageScope(test: self)
    }

    var launcherScope: LauncherScope {
        return LauncherScope(test: self)
    }
}
