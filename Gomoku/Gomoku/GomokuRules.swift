//
//  GomokuRules.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 27/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

class GomokuRules {
    func isWin(board: Board) -> Bool {
        let row = 0
        var playerPiecesInARow = 0
        
        for col in 0..<board.WIDTH {
            // Underscore here because it should NEVER fail
            let (playersPiece, _) = board.get(intersection: Intersection(row,col))
            if playersPiece == .White {
                playerPiecesInARow += 1
            }
        }
        return playerPiecesInARow > 4
    }
}
