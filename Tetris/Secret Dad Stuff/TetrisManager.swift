//
//  TetrisManager.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Foundation

class TetrisManager {

    static let shared = TetrisManager()
    private init() { }

    public var scene: Scene!

    public var tetris: Tetris!

    public var matrix: Matrix!

}
