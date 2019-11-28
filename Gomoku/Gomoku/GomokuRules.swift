//
//  GomokuRules.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 27/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

class GomokuRules {
    func isWin(board: Board, player: Player) -> Bool {
        if isRowWin(board: board, player: player) || isColWin(board: board, player: player){
            return true
        } else {
            return false
        }
    }
    
    func isRowWin(board: Board, player: Player) -> Bool {
        var consecutiveStones = 0
        
        for row in 0..<board.HEIGHT {
            for col in 0..<board.WIDTH {
                // Underscore here because it should NEVER fail
                let (playersPiece, _) = board.get(row,col)
                if playersPiece == player {
                    consecutiveStones += 1
                    if consecutiveStones > 4 {
                        return true
                    }
                } else {
                    consecutiveStones = 0
                }
            }
        }
        
        return false
    }
    
    func isColWin(board: Board, player: Player) -> Bool {
        var consecutiveStones = 0

        for col in 0..<board.WIDTH {
            for row in 0..<board.HEIGHT {
                // Underscore here because it should NEVER fail
                let (playersPiece, _) = board.get(row,col)
                if playersPiece == player {
                    consecutiveStones += 1
                    if consecutiveStones > 4 {
                        return true
                    }
                } else {
                    consecutiveStones = 0
                }
            }
        }

        return false
    }
    
    func isConsecutive(board: Board, player: Player,  iMax: Int, jMax: Int, getStone: (_ i: Int, _ j: Int) -> Player) -> Bool{
        var consecutiveStones = 0
        for i in 0..<iMax {
            for j in 0..<jMax {
                let playersPiece = getStone(i, j)
                if playersPiece == player {
                    consecutiveStones += 1
                    if consecutiveStones > 4 {
                        return true
                    }
                } else {
                    consecutiveStones = 0
                }
            }
            
        }
        return false

    }
    
}
