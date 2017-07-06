//
//  StackReviewUITests.swift
//  StackReviewUITests
//
//  Created by Flatiron School on 7/5/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import XCTest

class StackReviewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    var horizontalSizeClass: XCUIUserInterfaceSizeClass {
        return app.windows.element(boundBy: 0).horizontalSizeClass
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
        
    }
    
    func testCanNavigateToAboutScreen() {
        tapPancakeHousesButtonIfNeeded()
        
        let aboutButton = app.navigationBars.buttons["About"]
        aboutButton.tap()
        
        let aboutTittleText = app.navigationBars.staticTexts["About"]
        XCTAssertTrue(aboutTittleText.exists, "Should be on the about screen")
    }
    
    func testCaNavigateToPancakeHouseDetailScreen() {
        tapPancakeHousesButtonIfNeeded()
        
        let tableText = app.tables.staticTexts["Stack 'em High"]
        tableText.tap()
        
        let pancakeText = app.staticTexts["Stack 'em High"]
        XCTAssertTrue(pancakeText.exists)
        
        let map = app.maps.element
        XCTAssertTrue(map.exists)
        
    }
    
    func tapPancakeHousesButtonIfNeeded() {
        if horizontalSizeClass != .regular {
            let pancakeHouseButton = app.navigationBars.buttons["Pancake Houses"]
            pancakeHouseButton.tap()
        }
    }
}
