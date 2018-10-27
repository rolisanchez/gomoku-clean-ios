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
    
    func testNotEmptyBoardButNotWin_isNotAWin() throws {
        try board.place(intersection: Intersection(1,1), player: .White)
        XCTAssertFalse(rules.isWin(board: board))
    }
    
    func fiveInARowInTheFirstRow_isAWin() throws {
        for col in 0..<5 {
            try board.place(intersection: Intersection(0,col), player: .White)
        }
    }

}
