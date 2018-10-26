//
//  Board.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 2/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//


enum Player {
    case White
    case Black
    case Empty
}

class SpaceOccupied: Error {
    
}

class BadLocation: Error {
    
}

typealias Intersection = (row: Int, column: Int)

class Board {
    let WIDTH = 19
    let HEIGHT = 19
    var placedStones = [Int: Player]()
    
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(row: Int, column: Int, player: Player) throws {
        try place(intersection: Intersection(row, column), player: player)
    }
    
    func place(intersection: Intersection, player: Player) throws {
        let loc = try makeLocation(intersection: intersection)
        if placedStones[loc] != nil {
            throw SpaceOccupied()
        }
        placedStones[loc] = player
    }
    
    func makeLocation(intersection: Intersection) throws -> Int {
        return try makeLocation(row: intersection.row, column: intersection.column)
    }
    
    func makeLocation(row: Int, column: Int) throws -> Int  {
        if row < 0 || row >= WIDTH || column < 0 || column >= HEIGHT {
            throw BadLocation()
        }
        return column * WIDTH + row
    }
    
    func get(row: Int, column: Int) throws -> Player {
        return try get(intersection: Intersection(row, column))
    }
    
    func get(intersection: Intersection) throws -> Player {
        let loc = try makeLocation(intersection: intersection)
        if let stone = placedStones[loc] {
            return stone
        } else {
            return Player.Empty
        }
        
    }
}
