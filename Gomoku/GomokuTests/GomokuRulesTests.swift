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
    
    func testEmptyBoard_isNotAWin() throws {
        try XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() throws {
        try board.place(intersection: Intersection(1,1), player: .White)
        try XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() throws {
        for col in 0..<5 {
            try board.place(intersection: Intersection(0,col), player: .White)
        }
        try XCTAssertTrue(rules.isWin(board: board))

    }
    
    func testFourInARowInTheFirstRow_isALose() throws {
        for col in 0..<4 {
        try board.place(intersection: Intersection(0,col), player: .White)
        }
        try XCTAssertFalse(rules.isWin(board: board))
    }
    
    func testFiveInARowInAnyRow_isAWin() throws {
        for row in 0..<board.HEIGHT {
            for col in 0..<5 {
                try board.place(intersection: Intersection(row,col), player: .White)
            }
            try XCTAssertTrue(rules.isWin(board: board))
            board = Board()
        }
        
        
        
    }

}
