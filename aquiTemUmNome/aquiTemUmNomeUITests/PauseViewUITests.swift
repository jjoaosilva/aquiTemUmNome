//
//  PauseViewUITests.swift
//  aquiTemUmNomeUITests
//
//  Created by Cecilia Soares on 25/09/20.
//  Copyright © 2020 aquiTemUmNomeOrganization. All rights reserved.
//

import XCTest
@testable import aquiTemUmNome
class PauseViewUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        let app = XCUIApplication()
        app.launch()
        let playButton = app.buttons["play"]
        XCTAssertTrue(playButton.isHittable)
        playButton.tap()
        let pauseGame = app.buttons["pause"]
        _ = pauseGame.waitForExistence(timeout: 3.25)
        XCTAssertTrue(pauseGame.isHittable)
        pauseGame.tap()
        playButton.tap()
//        menu
        pauseGame.tap()
        let goHome = app.buttons["home"]
        XCTAssertTrue(goHome.isHittable)
        goHome.tap()
//        reset
        playButton.tap()
//        _ = pauseGame.waitForExistence(timeout: 3.25)
//        pauseGame.tap()
//        let resetGame = app.buttons["arrow.counterclockwise"]
//        XCTAssertTrue(resetGame.isHittable)
//        resetGame.tap()
//        // Use XCTAssert and related functions to verify your tests produce the correct results.

    }

}
