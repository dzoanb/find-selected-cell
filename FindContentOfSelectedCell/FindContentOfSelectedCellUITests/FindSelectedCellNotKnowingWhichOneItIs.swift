//
//  FindSelectedCellNotKnowingWhichOneItIs.swift
//  FindContentOfSelectedCell
//
//  Created by Joanna Bednarz on 08/05/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class FindSelectedCellNotKnowingWhichOneItIs: AppUITestCase {

    lazy var table: XCUIElement = self.app.tables.element
    lazy var selectedCell: XCUIElement = self.table.cells.element(matching: NSPredicate(format: "isSelected == true"))
    let randomIndexOutsideTheScreen = Int(arc4random_uniform(17)) + 13

    override func setUp() {
        super.setUp()
        TestLauncher(options: [LaunchEnvironment(key: "CELL_TO_SELECT_INDEX", value: "\(randomIndexOutsideTheScreen)")])
            .configure(app)
            .launch()
    }
    
    func testFindWithAutoMate() {
        XCTAssertFalse(selectedCell.isVisible)
        table.swipe(to: .down, untilVisible: selectedCell)
        XCTAssertTrue(selectedCell.isVisible)
    }

    func testFindWithoutAutoMate() {
        XCTAssertFalse(selectedCell.isHittable)
        selectedCell.tap() // Only then framework will swipe to this cell.
        XCTAssertTrue(selectedCell.isHittable)
    }
}
