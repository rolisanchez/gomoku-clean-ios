//
//  GridView.swift
//  Gomoku
//
//  Created by Victor Rolando Sanchez Jara on 29/10/18.
//  Copyright © 2018 vrsj. All rights reserved.
//

import UIKit

class GridView: UIView {
    let board : Board
    
    init(frame: CGRect, board: Board) {
        self.board = board
        super.init(frame: frame)
        self.backgroundColor = UIColor(hexString: "C58124")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let outerBoxSize = min(rect.size.width, rect.size.height)
        let cellCount = board.WIDTH + 1
        let cellSize = outerBoxSize / CGFloat(cellCount)
        
        let path = UIBezierPath()
        
        for i in 1..<cellCount {
            let xPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: xPos, y: cellSize  ))
            path.addLine(to: CGPoint(x: xPos, y: outerBoxSize - cellSize))
        }
        for i in 1..<cellCount {
            let yPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x: cellSize, y: yPos ))
            path.addLine(to: CGPoint(x: outerBoxSize - cellSize, y: yPos))
        }
        
        path.lineWidth = 1.0
        path.stroke()
        
        for col in 0..<board.WIDTH {
            for row in 0..<board.HEIGHT {
                let stone = try! board.get(intersection: Intersection(row, col))
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
