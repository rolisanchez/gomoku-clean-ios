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
    var game: Game!
    
    override func setUp() {
        super.setUp()
        Game.boardFactory = BoardFactoryImpl()
        game = Game()
    }
    
    func testCanCreateGame() {
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
    func testAfterATurn_isOtherPlayersTurn() {
        game.takeTurn(0,0)
        XCTAssertEqual(Player.White, game.getBoard().get(0, 0).0)
        XCTAssertEqual(Player.Black, game.whoseTurn())
        
        game.takeTurn(1,0)
        XCTAssertEqual(Player.Black, game.getBoard().get(1, 0).0)
        XCTAssertEqual(Player.White, game.whoseTurn())
    }

}
