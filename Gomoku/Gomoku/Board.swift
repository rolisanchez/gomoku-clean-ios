//
//  Board.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 3/8/20.
//  Copyright © 2020 vrsj. All rights reserved.
//

protocol Board {
    func takeTurn(_ row: Int, _ column: Int) -> BoardError?
    func place(_ row: Int, _ column: Int, _ player: Player) -> BoardError?
    func get(_ row: Int, _ column: Int) -> (Player?, BoardError?)
    func getWidth() -> Int
    func getHeight() -> Int
    func whoseTurn() -> Player
}
