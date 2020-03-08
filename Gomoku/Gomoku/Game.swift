//
//  Game.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 8/19/19.
//  Copyright © 2019 vrsj. All rights reserved.
//

import Foundation

protocol BoardFactory {
    func makeBoard() -> Board
}

class Game {
    private let board: Board
    private var player = Player.White
    private var rules: GomokuRules
    static var boardFactory: BoardFactory!
    
    init(){
        self.board = Game.boardFactory!.makeBoard()
        self.rules = GomokuRules()
    }
    
    func whoseTurn() -> Player {
        return player
    }
    
    func takeTurn(_ row: Int, _ column: Int){
        _ = board.place(row, column, whoseTurn())
        player = other(player)
    }
    
    func other(_ player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
    }
    
    func getBoard() -> BoardState {
        return board as! BoardState
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
}
