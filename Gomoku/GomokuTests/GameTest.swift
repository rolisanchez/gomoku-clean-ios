//
//  GameTest.swift
//  GomokuTests
//
//  Created by Victor Rolando Sanchez Jara on 8/19/19.
//  Copyright © 2019 vrsj. All rights reserved.
//

import XCTest
@testable import Gomoku

class GameTest: XCTestCase {
    var board : Board!
    var rules : GomokuRules!
    var game: Game!
    
    override func setUp() {
        super.setUp()
        board = Board()
        rules = GomokuRules()
        game = Game(board: board, rules: rules)
    }
    
    func testCanCreateGame() {
//        let board = Board()
//        let rules = GomokuRules()
//        let game = Game(board: board, rules: rules)
        
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
    func testAfterWhitseTurn_isBlacksTurn() {
        game.takeTurn(0,0)
        XCTAssertEqual(Player.White, board.get(0, 0).0)
        XCTAssertEqual(Player.Black, game.whoseTurn())
    }

}
