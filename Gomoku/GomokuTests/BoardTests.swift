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
    
    func testCanAddOneWhiteStone() {
        _ = board.place(1, 1, .White)
        XCTAssertEqual(1, board.stonesPlaced())
        XCTAssertEqual(.White, board.get(1, 1).0)
        
        _ = board.place(board.WIDTH-1, board.HEIGHT-1, .Black)
        
        XCTAssertEqual(2, board.stonesPlaced())
        XCTAssertEqual(.Black, board.get(board.WIDTH-1, board.HEIGHT-1).0)
    }
    
    func testKnowsAboutEmptyIntersections() {
        XCTAssertEqual(.Empty, board.get(0,1).0)
        _ =  board.place(0,1, .White)
        XCTAssertEqual(.White, board.get(0,1).0)
    }
    
    func testCannotAddToOccupiedIntersection() {
        _ =  board.place(0, 0, .White)
        
        XCTAssertEqual(board.place(0, 0, .Black), .SpaceOccupied)
        XCTAssertEqual(board.place(0, 0, .White), .SpaceOccupied)
    }
    
    func testCannotPlaceStonesOutsideBounds() {

    XCTAssertEqual(board.place(-1,-1, .White), .BadLocation)
        XCTAssertEqual(board.place(board.WIDTH, board.HEIGHT, .White), .BadLocation)
        XCTAssertEqual(board.place(0,-1, .White), .BadLocation)
        XCTAssertEqual(board.place(0,board.HEIGHT, .White), .BadLocation)
        XCTAssertEqual(board.place(-1,0, .White), .BadLocation)
        XCTAssertEqual(board.place(board.WIDTH,0, .White), .BadLocation)

        XCTAssertEqual(0, board.stonesPlaced())
    }

}
