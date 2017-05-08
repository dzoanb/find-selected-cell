//
//  FindPreselectedCellWithoutAutomate.swift
//  FindContentOfSelectedCell
//
//  Created by Joanna Bednarz on 08/05/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest

class FindPreselectedCellWithoutAutomate: XCTestCase {

    let app = XCUIApplication()
    lazy var selectedCell: XCUIElement = self.app.tables.cells.element(matching: NSPredicate(format: "isSelected == true"))

    override func setUp() {
        super.setUp()

        // I want to make sure cell is selected before I enter the view so I'm passing desired row to application to make the preparation for me.
        app.launchEnvironment["CELL_TO_SELECT_INDEX"] = "14"
        app.launch()
    }
    
    func testSelectedCellExists() {
        XCTAssertTrue(selectedCell.exists)
        XCTAssertTrue(selectedCell.staticTexts["Cell At Row 14"].exists)
        XCTAssertFalse(selectedCell.isHittable)
    }

    func testSelectedCellIsVisible() {
        XCTAssertTrue(selectedCell.exists)
        selectedCell.tap()
        XCTAssertTrue(selectedCell.isHittable)
        XCTAssertTrue(selectedCell.staticTexts["Cell At Row 14"].isHittable)
    }

}
