//
//  MenuUITests.swift
//  aquiTemUmNomeUITests
//
//  Created by Larissa Uchoa on 25/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import XCTest
@testable import aquiTemUmNome
// swiftlint:disable line_length
class MenuUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.buttons["volume high"].tap()
        app.buttons["mute"].tap()
        app.buttons["favorite"].tap()
        app.buttons["shopping cart"].tap()
        app.buttons["reply"].tap()
        app.buttons["play"].tap()
    }

}
