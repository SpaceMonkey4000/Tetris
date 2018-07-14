//
//  Cell.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import SpriteKit

class Cell {

    let spriteNode = SKSpriteNode()

    // Width and height of each cell, in pixels.
    public static let size = CGSize(width: 32.0, height: 32.0)

    init() {
        spriteNode.size = Cell.size
    }
}
