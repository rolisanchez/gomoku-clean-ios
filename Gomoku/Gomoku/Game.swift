//
//  Game.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 8/19/19.
//  Copyright © 2019 vrsj. All rights reserved.
//

import Foundation

class Game {
    let board: Board
    var player = Player.White
    
    init(board: Board, rules: GomokuRules) {
        self.board = board
    }
    
    func whoseTurn() -> Player {
        return player
    }
    
    func takeTurn(_ row: Int, _ column: Int){
        board.place(row, column, whoseTurn())
        player = other(player)
    }
    
    func other(_ player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
    }
    
    func getBoard() -> Board {
        return board
    }
}
