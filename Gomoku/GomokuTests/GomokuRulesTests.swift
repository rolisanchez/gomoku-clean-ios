//
//  GomokuRulesTests.swift
//  GomokuTests
//
//  Created by Victor Rolando Sanchez Jara on 27/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import XCTest
@testable import Gomoku

class GomokuRulesTests: XCTestCase {
    var board : Board!
    var rules : GomokuRules!
    
    override func setUp() {
        super.setUp()
        board = Board()
        rules = GomokuRules()
    }
    
    func testEmptyBoard_isNotAWin() {
        XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() {
        _ = board.place(1,1, .White)
        XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() {
        for col in 0..<5 {
            _ = board.place(0, col, .White)
        }
        XCTAssertTrue(rules.isWin(board: board))

    }
    
    func testFourInARowInTheFirstRow_isALose() {
        for col in 0..<4 {
        _ = board.place(0,col, .White)
        }
        XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testFiveInARowInAnyRow_isAWin() {
        for row in 0..<board.HEIGHT {
            for col in 0..<5 {
                _ = board.place(row,col, .White)
            }
            XCTAssertTrue(rules.isWin(board: board))
            board = Board()
        }
        
    }

}
