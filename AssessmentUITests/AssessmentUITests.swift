//
//  AssessmentUITests.swift
//  AssessmentUITests
//

import XCTest
@testable import Assessment

final class AssessmentUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func transactionsList() -> XCUIElement {
        let table = app.tables["transactionsList"]
        if table.exists { return table }
        
        let collection = app.collectionViews["transactionsList"]
        if collection.exists { return collection }
        
        return table
    }
    
    func testCloseReturnsToList() {
        let list = transactionsList()
        XCTAssertTrue(list.waitForExistence(timeout: 8), "transactionsList not found")
        
        let firstCell = list.cells.element(boundBy: 0)
        XCTAssertTrue(firstCell.waitForExistence(timeout: 8), "No cells found in list")
        
        firstCell.tap()
        
        let closeBtn = app.buttons["closeButton"]
        if closeBtn.waitForExistence(timeout: 5) {
            closeBtn.tap()
        } else {
            let closeFallback = app.otherElements["closeButton"]
            XCTAssertTrue(closeFallback.waitForExistence(timeout: 5), "Close button not found")
            closeFallback.tap()
        }
        
        let listAfter = transactionsList()
        XCTAssertTrue(listAfter.waitForExistence(timeout: 8), "Did not return to list")
    }
}
