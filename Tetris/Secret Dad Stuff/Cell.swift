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
    public static let size = CGSize(width: 64.0, height: 64.0)

    init() {
        spriteNode.size = Cell.size

        spriteNode.texture = SKTexture(imageNamed: "Pikachu")
    }

    public func layout(row: Int, column: Int) {
        let matrix: Matrix = TetrisManager.shared.matrix
        let scene: Scene = TetrisManager.shared.scene

        spriteNode.position = matrix.locationOfCellAt(row: row, column: column)
        scene.addChild(spriteNode)
    }

}
