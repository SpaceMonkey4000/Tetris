//
//  Cell.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import SpriteKit

class Cell {

    private let spriteNode = SKSpriteNode()

    private var row: Int = -1
    private var column: Int = -1

    // If textureIndex is nil, this texture is assigned to the sprite.    
    public var defaultTextureIndex: Int? = nil {
        didSet {
            // This has the side effect of updating the sprite's texture
            // to the default texture, if necessary.
            textureIndex = textureIndex
        }
    }

    // Width and height of each cell, in pixels.
    // The textures are assembled into a texture atlas, so a power of two here is probably advantageous.
    public static let size = CGSize(width: 64.0, height: 64.0)

    public var textureIndex: Int? {
        didSet {
            guard let textureIndex = textureIndex ?? defaultTextureIndex else {
                spriteNode.texture = nil
                return
            }
            let textureAtlasController: TextureAtlasController = TetrisManager.shared.textureAtlasController
            guard let texture = textureAtlasController.texture(withIndex: textureIndex) else {
                print("Error: Could not find texture with index: \(textureIndex)")
                fatalError()
            }
            spriteNode.texture = texture
        }
    }

    init() {
        spriteNode.size = Cell.size
    }

    public func layout(x: Int, y: Int) {
        let matrix: Matrix = TetrisManager.shared.matrix
        let scene: Scene = TetrisManager.shared.scene

        self.row = y
        self.column = x

        spriteNode.position = matrix.locationOfCellAt(x: x, y: y)
        scene.addChild(spriteNode)
    }

}
