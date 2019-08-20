//
//  ViewController.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 2/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var statusLabel: UILabel!
    var board: Board!
    var rules: GomokuRules!
    var game: Game!
    var presenter: GamePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "E2E2E2")
        board = Board()
        rules = GomokuRules()
        game = Game(board: board, rules: rules)
        presenter = GamePresenter()
        let gridView = GridView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width), game: game)
        self.view.addSubview(gridView)
//        gridView.tapResponder = () ->
        let labelWidth: CGFloat = 100.0
        statusLabel = UILabel(frame: CGRect(x: (view.frame.width - labelWidth) / 2.0 , y: 100, width: 100, height: 100))
        self.view.addSubview(statusLabel)
        statusLabel.textColor = .darkGray
        statusLabel.textAlignment = .center
        statusLabel.text = presenter.getPlayerStatus(player: game.whoseTurn())
    }


}

