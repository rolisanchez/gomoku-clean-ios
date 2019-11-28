//
//  GamePresenterTest.swift
//  GomokuTests
//
//  Created by Victor Rolando Sanchez Jara on 8/20/19.
//  Copyright © 2019 vrsj. All rights reserved.
//

import XCTest
@testable import Gomoku

class GamePresenterTest: XCTestCase {
    func testFormatOfPlayerStatus(){
        let presenter = GamePresenter()
        XCTAssertEqual("White's Turn", presenter.getPlayerStatus(player: .White))
        XCTAssertEqual("Black's Turn", presenter.getPlayerStatus(player: .Black))
        XCTAssertEqual("TILT", presenter.getPlayerStatus(player: .Empty))
    }

    func testFormatOfPlayerWinStatus(){
        let presenter = GamePresenter()
        XCTAssertEqual("White Wins!", presenter.getWinStatus(player: .White))
        XCTAssertEqual("Black Wins!", presenter.getWinStatus(player: .Black))
        XCTAssertEqual("TILT", presenter.getWinStatus(player: .Empty))
    }
}
