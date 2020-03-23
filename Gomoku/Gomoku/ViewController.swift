//
//  ViewController.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 2/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var statusLabel: UILabel = {
       return makeStatusLabel()
    }()
    lazy var game: Game = {
        return Game()
    }()
    lazy var presenter: GamePresenter = {
       return GamePresenter()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "E2E2E2")
        
        let gridView = GridView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width), board: game.getBoard())
        
        self.view.addSubview(gridView)
        
        gridView.setResponder(responder: { (col, row) in
            self.respondToTap(col: col, row: row)
            
        })

        self.view.addSubview(statusLabel)
        statusLabel.textColor = .darkGray
        statusLabel.textAlignment = .center
        statusLabel.text = presenter.getPlayerStatus(player: game.whoseTurn())
    }

    func respondToTap(col: Int, row: Int){
        let tappingPlayer = game.whoseTurn()
        _ = game.takeTurn(col,row) // Changes to next player
        if game.getRules().isWin(board: game.getBoard(), player: tappingPlayer){
            statusLabel.text = self.presenter.getWinStatus(player: tappingPlayer)
        } else {
            statusLabel.text = self.presenter.getPlayerStatus(player: self.game.whoseTurn())
        }
        
        
    }
    func makeStatusLabel() -> UILabel {
        let labelWidth: CGFloat = 100.0

        return UILabel(frame: CGRect(x: (view.frame.width - labelWidth) / 2.0 , y: 100, width: 100, height: 100))
    }
    
}

