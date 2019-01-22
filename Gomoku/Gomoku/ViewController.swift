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
        _ = board.place(intersection: Intersection(10,10), player: .White)
        _ = board.place(intersection: Intersection(11,11), player: .Black)
        _ = board.place(intersection: Intersection(8,8), player: .White)
        _ = board.place(intersection: Intersection(9,9), player: .Black)
        let gridView = GridView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width), board: board)
        
        self.view.addSubview(gridView)
    }


}

