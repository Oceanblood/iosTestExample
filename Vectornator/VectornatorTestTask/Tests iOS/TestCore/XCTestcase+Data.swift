//
//  XCTestcase+Data.swift
//  Tests iOS
//
//  Created by Ilya Belchenko on 8/10/22.
//

import Foundation
import XCTest

private var kTestCaseDataAssociatedKey = "testCaseData"

public extension XCTestCase {

    /// this variable could be used with app luanch arguments and necessary data for tests
    ///
    var data: TestCaseData {
        get {
            if let savedObject = objc_getAssociatedObject(self, &kTestCaseDataAssociatedKey) as? TestCaseData {
                return savedObject
            }
            let newData = TestCaseData()
            objc_setAssociatedObject(
                self,
                &kTestCaseDataAssociatedKey,
                newData,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            )
            return newData
        }
        set {
            objc_setAssociatedObject(
                self,
                &kTestCaseDataAssociatedKey,
                newValue,
                objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN
            )
        }
    }

    func resetData() {
        data.reset()
    }

}

public class TestCaseData {

    public var launchArguments = [String]()
    public var appLaunched = false
    public var finished = false
    var lastScreenshotIndex = 0
    public var currentRetryCount = 0

    func reset() {
        appLaunched = false
        launchArguments = []
    }
}

