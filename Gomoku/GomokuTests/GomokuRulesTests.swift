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
        XCTAssertFalse(rules.isWin(board: board, player: .White))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() {
        _ = board.place(1,1, .White)
        XCTAssertFalse(rules.isWin(board: board, player: .White))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() {
        for col in 0..<5 {
            _ = board.place(0, col, .Black)
        }
        XCTAssertTrue(rules.isWin(board: board, player: .Black))

    }
        
    func testFiceConsecutiveStonesForOtherPlayer_isALose(){
        for col in 0..<5 {
            _ = board.place(0, col, .Black)
        }
        XCTAssertFalse(rules.isWin(board: board, player: .White))
    }
    
    func testFourInARowInTheFirstRow_isALose() {
        for col in 0..<4 {
            _ = board.place(0,col, .White)
        }
        XCTAssertFalse(rules.isWin(board: board, player: .White))
    }
    
    func testSixInARowInTheFirstRow_isAWin() {
           for col in 0..<6 {
               _ = board.place(0, col, .White)
           }
           XCTAssertTrue(rules.isWin(board: board, player: .White))

       }
    
    func testFiveInARowInAnyRow_isAWin() {
        for row in 0..<board.HEIGHT {
            for col in 0..<5 {
                _ = board.place(row,col, .Black)
            }
            XCTAssertTrue(rules.isWin(board: board, player: .Black))
            board = Board()
        }
    }
    
    func testFiveNonConsecutiveStonesInRow_isALose() {
        for row in stride(from: 1, to: 10, by: 2){
            _ = board.place(row, 0, .White)
        }
        XCTAssertFalse(rules.isWin(board: board, player: .White))
    }
    
    func testFiveConsecutiveStonesInColumn_isAWin() {
        for row in 0..<6 {
            _ = board.place(row, 0, .White)
        }
        XCTAssertTrue(rules.isWin(board: board, player: .White))
    }

}
