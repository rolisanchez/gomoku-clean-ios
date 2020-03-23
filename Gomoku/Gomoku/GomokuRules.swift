//
//  GomokuRules.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 27/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

class GomokuRules {
    let winLength = 5
    
    func isWin(board: BoardState, player: Player) -> Bool {
        if isRowWin(board: board, player: player) || isColWin(board: board, player: player){
            return true
        } else {
            return false
        }
    }
    
    func isRowWin(board: BoardState, player: Player) -> Bool {
        return isConsecutive(board: board, player: player, iMax: board.getHeight(), jMax: board.getWidth(), getStone: { (i, j) -> Player in
            return board.get(i,j).0!
        })
    }
    
    func isColWin(board: BoardState, player: Player) -> Bool {
        return isConsecutive(board: board, player: player, iMax: board.getWidth(), jMax: board.getHeight(), getStone: { (i, j) -> Player in
            return board.get(j,i).0!
        })
    }
    
    func isConsecutive(board: BoardState, player: Player,  iMax: Int, jMax: Int, getStone: (_ i: Int, _ j: Int) -> Player) -> Bool {
        var consecutiveStones = 0
        for i in 0..<iMax {
            for j in 0..<jMax {
                let playersPiece = getStone(i, j)
                consecutiveStones = calculateConsecutiveStones(consecutiveStones, playersPiece, player)
                if consecutiveStones >= winLength {
                    return true
                }
            }
            
        }
        return false
    }
    
    func calculateConsecutiveStones(_ consecutiveStones: Int, _ playerPiece: Player, _ player: Player) -> Int {
        return playerPiece == player ? consecutiveStones + 1 : 0
    }
}
