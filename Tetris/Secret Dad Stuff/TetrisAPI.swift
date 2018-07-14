//
//  TetrisAPI.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Cocoa

/// Adds a texture with a name of an image in the asset catalog.
public func texture(named name: String) -> Int {
    guard let image = NSImage(named: NSImage.Name(name)) else {
        print("Could not find image in asset catalog: \(name)")
        fatalError()
    }

    return TetrisManager.shared.textureAtlasController.addTexture(name: name, image: image)
}

/// Sets a texture at a grid cell.
public func setTexture(_ index: Int, row: Int, column: Int) {
    let matrix: Matrix = TetrisManager.shared.matrix
    let cell = matrix.cellAt(row: row, column: column)
    if cell == nil {
        print("Error: Tried to set texture of cell which is out of range at row \(row), column \(column)")
        fatalError()
    }
    cell?.textureIndex = index
}

/// Clears the texture at a grid cell.
public func clearTexture(row: Int, column: Int) {
    let matrix: Matrix = TetrisManager.shared.matrix
    let cell = matrix.cellAt(row: row, column: column)
    if cell == nil {
        print("Error: Tried to clear texture of cell which is out of range at row \(row), column \(column)")
        fatalError()
    }
    cell?.textureIndex = nil
}
