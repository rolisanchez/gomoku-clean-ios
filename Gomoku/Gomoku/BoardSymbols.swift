//
//  BoardSymbols.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 3/8/20.
//  Copyright © 2020 vrsj. All rights reserved.
//

enum Player {
    case White
    case Black
    case Empty
}

enum BoardError {
    case SpaceOccupied
    case BadLocation
}
