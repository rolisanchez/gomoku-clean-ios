//
//  BoardTests.swift
//  GomokuTests
//
//  Created by Victor Rolando Sanchez Jara on 2/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import XCTest
@testable import Gomoku

class BoardTests: XCTestCase {
    var board: Board!
    
    override func setUp() {
        super.setUp()
        board = Board()
    }
    
    func testNewBoardHasNoStones() {
        
        let stones = board.stonesPlaced()
        XCTAssertEqual(0, stones)
    }
    
    func testCanAddOneStone() throws {
        let row = 1
        let col = 1
        let player = Player.White
        try board.place(row: row, column: col, player: player)
        
        let stones = board.stonesPlaced()
        XCTAssertEqual(1, stones)
        
        let placedStone = try board.get(row: row, column: col)
         XCTAssertEqual(Player.White, placedStone)
        
    }
    
    func testKnosAboutEmptyIntersections() throws {
        XCTAssertEqual(Player.Empty, try board.get(row: 0, column: 1))
        
        try board.place(row: 0, column: 1, player: Player.White)
        
       
        XCTAssertEqual(Player.White, try board.get(row: 0, column: 1))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(row: 0, column: 0, player: Player.White)
        XCTAssertThrowsError(try board.place(row: 0, column: 0, player: Player.Black))
    }
    
    func testCannotPlaceStonesOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(row: 42, column: 42, player: Player.White))
        
        
        
        
        
    }


}
