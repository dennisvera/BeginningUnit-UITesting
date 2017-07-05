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
    
    if horizontalSizeClass != .regular {    
      let pancakeHouseButton = app.navigationBars.buttons["Pancake Houses"]
      pancakeHouseButton.tap()
    }
    
    let aboutButton = app.navigationBars.buttons["About"]
    aboutButton.tap()
    
    let aboutTitleText = app.navigationBars.staticTexts["About"]
    XCTAssertTrue(aboutTitleText.exists,
                  "Should be on the about screen")
  }
}
