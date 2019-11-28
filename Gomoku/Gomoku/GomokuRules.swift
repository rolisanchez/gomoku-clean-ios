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
        return isConsecutive(board: board, player: player, iMax: board.HEIGHT, jMax: board.WIDTH, getStone: { (i, j) -> Player in
            return board.get(i,j).0!
        })
    }
    
    func isColWin(board: Board, player: Player) -> Bool {
        return isConsecutive(board: board, player: player, iMax: board.WIDTH, jMax: board.HEIGHT, getStone: { (i, j) -> Player in
            return board.get(j,i).0!
        })
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
