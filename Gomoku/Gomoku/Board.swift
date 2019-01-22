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

enum BoardError {
    case SpaceOccupied
    case BadLocation
}

typealias Intersection = (row: Int, column: Int)

class Board {
    let WIDTH = 19
    let HEIGHT = 19
    var placedStones = [Int: Player]()
    
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(row: Int, column: Int, player: Player) -> BoardError? {
        return place(intersection: Intersection(row, column), player: player)
    }
    
    func place(intersection: Intersection, player: Player) -> BoardError? {
        let (loc, error) = makeLocation(intersection: intersection)
        
        if (error != nil) {
            return error
        }
        
        if placedStones[loc] != nil {
            return .SpaceOccupied
        }

        placedStones[loc] = player
        
        return nil
    }
    
    func makeLocation(intersection: Intersection) -> (Int, BoardError?) {
        return makeLocation(row: intersection.row, column: intersection.column)
    }
    
    func makeLocation(row: Int, column: Int) -> (Int, BoardError?)  {
        var error : BoardError?
        
        if row < 0 || row >= WIDTH || column < 0 || column >= HEIGHT {
            error = .BadLocation
        }
        return (column * WIDTH + row, error)
    }
    
    func get(row: Int, column: Int) -> (Player?, BoardError?) {
        return get(intersection: Intersection(row, column))
    }
    
    func get(intersection: Intersection) -> (Player?, BoardError?) {
        let (loc, error) =  makeLocation(intersection: intersection)
        
        if (error != nil) {
            return (nil, error)
        }
        
        if let stone = placedStones[loc] {
            return (stone, nil)
        } else {
            return (Player.Empty, nil)
        }
        
    }
}
