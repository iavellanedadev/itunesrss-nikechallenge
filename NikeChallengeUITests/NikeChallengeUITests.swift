//
//  NikeChallengeUITests.swift
//  NikeChallengeUITests
//
//  Created by Consultant on 4/8/20.
//  Copyright © 2020 Avellaneda. All rights reserved.
//

import XCTest

class NikeChallengeUITests: XCTestCase {
    
    func testTableViewLoad() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let pray4LoveCell = app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Pray 4 Love"]
        expectation(for: NSPredicate(format: "exists == 1"), evaluatedWith: pray4LoveCell, handler: nil)
        
        waitForExpectations(timeout: 3.0, handler: nil)
        pray4LoveCell.tap()
        app.buttons["Check Out On iTunes Store"].tap()
        
    }
}
