//
//  GridView.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 29/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

typealias TapResponder = (_ row: Int, _ col: Int) -> ()
class GridView: UIView {
    let game: Game
    let board: Board
    let boardSize: CGFloat
    let cellCount: Int
    let cellSize: CGFloat
    var tapper: UITapGestureRecognizer!
    var tapResponder: TapResponder?
    
    init(frame: CGRect, game: Game) {
        self.game = game
        self.board = game.getBoard()
        self.boardSize = min(frame.size.width, frame.size.height)
        self.cellCount = board.WIDTH + 1
        self.cellSize = boardSize / CGFloat(cellCount)
        super.init(frame: frame)
        self.tapper = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        self.addGestureRecognizer(self.tapper)
        self.backgroundColor = UIColor(hexString: "C58124")
    }
    
    func setResponder(responder: @escaping (_ row: Int, _ col: Int) -> ()) {
        self.tapResponder = responder
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped (_ tapper: UITapGestureRecognizer) {
        let locationOfTap = tapper.location(ofTouch: 0, in: self)
        
        let tappedRow = Int((locationOfTap.y - cellSize) / cellSize + 0.5)
        let tappedColumn = Int((locationOfTap.x - cellSize) / cellSize + 0.5)
        self.tapResponder?(tappedRow, tappedColumn)
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        
        for i in 1..<cellCount {
            let xPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: xPos, y: cellSize  ))
            path.addLine(to: CGPoint(x: xPos, y: boardSize - cellSize))
        }
        for i in 1..<cellCount {
            let yPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: cellSize, y: yPos ))
            path.addLine(to: CGPoint(x: boardSize - cellSize, y: yPos))
        }
        
        path.lineWidth = 1.0
        path.stroke()
        
        for col in 0..<board.WIDTH {
            for row in 0..<board.HEIGHT {
                let (stone, _) = board.get(row, col)
                if stone != Player.Empty {
                    let stonePath = UIBezierPath()
                    stone == Player.White ? UIColor.white.set() : UIColor.black.set()
                    
                    let center = CGPoint(x: CGFloat(col + 1) * cellSize, y: CGFloat(row + 1) * cellSize)
                    let stoneRadius = cellSize / 2.5
                    stonePath.move(to: center)
                    stonePath.addArc(withCenter: center, radius: stoneRadius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
                    stonePath.fill()
                }
            }
        }
    }
}
