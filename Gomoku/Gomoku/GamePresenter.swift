//
//  GamePresenter.swift
//  GomokuTests
//
//  Created by Victor Rolando Sanchez Jara on 8/20/19.
//  Copyright © 2019 vrsj. All rights reserved.
//

import Foundation

class GamePresenter {
    var playerTurnNames = [Player.White: "White's Turn", Player.Black: "Black's Turn"]
    
    func getPlayerStatus(player: Player) -> String {
        return playerTurnNames[player]!
    }
}
