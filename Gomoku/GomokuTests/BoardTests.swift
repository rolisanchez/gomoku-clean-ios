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
    
    func testCanAddOneWhiteStone() throws {
        var intersection = Intersection(1,1)
        try board.place(intersection: intersection, player: .White)
        XCTAssertEqual(1, board.stonesPlaced())
        
        var placedStone = try board.get(intersection: intersection)
         XCTAssertEqual(.White, placedStone)
        
        intersection = Intersection(board.WIDTH-1, board.HEIGHT-1)
        try board.place(intersection: intersection, player: .Black)
        
        XCTAssertEqual(2, board.stonesPlaced())
        
        placedStone = try board.get(intersection: intersection)
        XCTAssertEqual(.Black, placedStone)
    }
    
    func testKnosAboutEmptyIntersections() throws {
        let emptyIntersection = Intersection(0,1)
        XCTAssertEqual(.Empty, try board.get(intersection: emptyIntersection))
        try board.place(intersection: emptyIntersection, player: .White)
        XCTAssertEqual(.White, try board.get(intersection: emptyIntersection))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        let intersection = Intersection(0,0)
        try board.place(intersection: intersection, player: Player.White)
        XCTAssertThrowsError(try board.place(intersection: intersection, player: .Black))
        XCTAssertThrowsError(try board.place(intersection: intersection, player: .White))
    }
    
    func testCannotPlaceStonesOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1,-1), player: .White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.WIDTH, board.HEIGHT), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,-1), player: .White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0, board.HEIGHT), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1,0), player: .White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.WIDTH,0) , player: Player.White))
        XCTAssertEqual(0, board.stonesPlaced())
    }

}
