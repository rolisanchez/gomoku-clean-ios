//
//  ViewController.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 2/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hexString: "E2E2E2")
        
        let board = Board()
        _ = board.place(10,10, .White)
        _ = board.place(11,11, .Black)
        _ = board.place(8,8, .White)
        _ = board.place(9,9, .Black)
        let gridView = GridView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width), board: board)
        
        self.view.addSubview(gridView)
    }


}

