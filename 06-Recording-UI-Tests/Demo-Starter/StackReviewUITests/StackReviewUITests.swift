//
//  StackReviewUITests.swift
//  StackReviewUITests
//
//  Created by Joshua Greene on 11/17/16.
//  Copyright © 2016 Razeware. All rights reserved.
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
        
        let aboutTitleText = app.navigationBars.staticTexts["About"]
        XCTAssertTrue(aboutTitleText.exists,
                      "Should be on the about screen")
    }
    
    func testCanNavigateToPancakeHouseScreen() {
        tapPancakeHousesButtonIfNeeded()
        
        let tableText = app.tables.staticTexts["Stack 'em High"]
        let pancakeText = app.staticTexts["Stack 'em High"]
        let map = app.maps.element
        
        tableText.tap()
        
        XCTAssertTrue(pancakeText.exists)
        XCTAssertTrue(map.exists)
    }
    
    func testPancakeHouseScreenHasScrollView() {
        tapPancakeHousesButtonIfNeeded()
        
        app.tables.cells["Stack 'em High"].staticTexts["Stack 'em High"].swipeUp()
        app.scrollViews.staticTexts["Stack 'em High"].tap()
        
        XCTAssertEqual(app.scrollViews.count, 1)
        
        app.scrollViews.staticTexts["As the name suggests, quantity is king here. Their famous \"endless pancake stack\" is served daily until 11am. If you eat 100 pancakes you win a bucket!"].tap()
        app.maps.containing(.other, identifier:"Colorado Springs").element.tap()
    }
    
    func testCanNavigateToAboutCopyrightShowHideButton() {
        tapPancakeHousesButtonIfNeeded()
        
        app.navigationBars["Pancake Houses"].buttons["About"].tap()
        
        let showHideCopyrightNoticeButton = app.buttons["Show/Hide Copyright Notice"]
        showHideCopyrightNoticeButton.tap()
        
        app.images["rw_logo"].tap()
        XCTAssertTrue(app.images["rw_logo"].exists)
        
        app.staticTexts["© Razeware 2016"].tap()
        
        app.buttons["Axis Switch"].tap()
        showHideCopyrightNoticeButton.tap()
    }
    
    func tapPancakeHousesButtonIfNeeded() {
        guard horizontalSizeClass != .regular else { return }
        let pancakeHouseButton = app.navigationBars.buttons["Pancake Houses"]
        pancakeHouseButton.tap()
    }
    
    
}
