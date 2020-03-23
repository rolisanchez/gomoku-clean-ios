//
//  Game.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 8/19/19.
//  Copyright © 2019 vrsj. All rights reserved.
//

import Foundation

protocol BoardFactory {
    func makeBoard() -> Board & BoardState
}

class Game {
    private let board: Board & BoardState
    private var rules: GomokuRules
    static var boardFactory: BoardFactory!
    
    init(){
        self.board = Game.boardFactory!.makeBoard()
        self.rules = GomokuRules()
    }
    
    func takeTurn(_ row: Int, _ column: Int) -> BoardError? {
        return board.takeTurn(row, column)
    }
    
    func whoseTurn() -> Player {
        return board.whoseTurn()
    }
        
    func getBoard() -> Board & BoardState {
        return board
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
