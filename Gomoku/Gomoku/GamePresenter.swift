//
//  GamePresenter.swift
//  GomokuTests
//
//  Created by Victor Rolando Sanchez Jara on 8/20/19.
//  Copyright © 2019 vrsj. All rights reserved.
//

import Foundation

class GamePresenter {
    var playerTurnNames = [Player.White: "White's Turn", Player.Black: "Black's Turn", Player.Empty: "TILT"]
    var winStatusStrings = [Player.White: "White Wins!", Player.Black: "Black Wins!", Player.Empty: "TILT"]
    
    func getPlayerStatus(player: Player) -> String {
        return playerTurnNames[player]!
    }
    
    func getWinStatus(player: Player) -> String {
        return winStatusStrings[player]!
    }
}
