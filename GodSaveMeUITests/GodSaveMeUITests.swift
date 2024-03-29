//
//  GodSaveMeUITests.swift
//  GodSaveMeUITests
//
//  Created by Адель Багаутдинов on 28/03/2019.
//  Copyright © 2019 Адель Багаутдинов. All rights reserved.
//

import XCTest

class GodSaveMeUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(app.navigationBars["Факты"].exists)
        XCTAssert(app.activityIndicators["In progress"].exists)
    }
    
    func testTabBar() {
        
        let tabBarsQuery = app.tabBars
        
        XCTAssert(tabBarsQuery.buttons["Факты"].exists)
        XCTAssert(tabBarsQuery.buttons["Избранное"].exists)
    }
    
    func testFavourite() {
        
        let tabBars = app.tabBars
        
        XCTAssert(tabBars.buttons["Избранное"].exists)
        
        tabBars.buttons["Избранное"].tap()
        
        XCTAssert(app.navigationBars["Избранное"].exists)
    }
}

