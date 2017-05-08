//
//  FindPreselectedCellWithAutoMate.swift
//  FindContentOfSelectedCell
//
//  Created by Joanna Bednarz on 08/05/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class FindPreselectedCellWithAutoMate: AppUITestCase {

    lazy var table: XCUIElement = self.app.tables.element
    lazy var selectedCell: XCUIElement = self.table.cells.element(containingLabels: [Locators.titleLabel: "Cell At Row 14"])

    override func setUp() {
        super.setUp()

        TestLauncher(options: [ LaunchEnvironment(key: "CELL_TO_SELECT_INDEX", value: "14") ])
            .configure(app)
            .launch()
    }
    
    func testSelectedCellExists() {
        XCTAssertTrue(selectedCell.exists)
        // We don't need to search element by `isSelected` flag so we can check if it is selected.
        XCTAssertTrue(selectedCell.isSelected)
        XCTAssertFalse(selectedCell.isHittable)
    }

    func testSelectedCellIsVisible() {
        XCTAssertTrue(selectedCell.exists)
        XCTAssertTrue(selectedCell.isSelected)
        table.swipe(to: .down, times: 30, from: app, until: selectedCell.isVisible)
        XCTAssertTrue(selectedCell.isHittable)
    }
}

enum Locators: String, Locator {
    case titleLabel
}
