//
//  Board.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 2/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

// Might be interesting in other situations, but delete for now
// Delete for now since it was a fix to reduce too much text
//typealias Intersection = (row: Int, column: Int)


class BoardFactoryImpl: BoardFactory {
    func makeBoard() -> Board {
        return BoardData()
    }
}

class BoardData: Board, BoardState {
    private let WIDTH = 19
    private let HEIGHT = 19
    
    var placedStones = [Int: Player]()
    
    func getWidth() -> Int {
        return WIDTH
    }
    
    func getHeight() -> Int {
        return HEIGHT
    }
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(_ row: Int, _ column: Int, _ player: Player) -> BoardError? {
        let (loc, error) = makeLocation(row, column)
        
        if (error != nil) {
            return error
        }
        
        if placedStones[loc] != nil {
            return .SpaceOccupied
        }

        placedStones[loc] = player
        
        return nil
    }
    
    func makeLocation(_ row: Int, _ column: Int) -> (Int, BoardError?)  {
        var error : BoardError?
        
        if row < 0 || row >= HEIGHT || column < 0 || column >= WIDTH {
            error = .BadLocation
        }
        return (column * WIDTH + row, error)
    }
    
    func get(_ row: Int, _ column: Int) -> (Player?, BoardError?) {
        let (loc, error) =  makeLocation(row, column)
        
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
