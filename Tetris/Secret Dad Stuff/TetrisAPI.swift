//
//  TetrisAPI.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Cocoa

/// Starts the game.
public func start() {
    _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
}

/// Adds a texture with a name of an image in the asset catalog.
public func texture(named name: String) -> Int {
    guard TetrisManager.shared.matrix == nil else {
        print("Error: setTexture must not be called in the start or update functions.")
        fatalError()
    }

    guard let image = NSImage(named: NSImage.Name(name)) else {
        print("Could not find image in asset catalog: \(name)")
        fatalError()
    }

    return TetrisManager.shared.textureAtlasController.addTexture(name: name, image: image)
}

/// Sets a texture at a grid cell.
public func setTexture(_ index: Int, row: Int, column: Int) {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: setTexture must only be called in the start or update functions.")
        fatalError()
    }

    let textureAtlasController: TextureAtlasController = TetrisManager.shared.textureAtlasController
    textureAtlasController.createIfNecessary()

    let cell = matrix.cellAt(row: row, column: column)
    if cell == nil {
        print("Warning: Tried to set texture of cell which is out of range: row \(row), column \(column)")
        return
    }
    cell?.textureIndex = index
}

/// Clears the texture at a grid cell.
public func clearTexture(row: Int, column: Int) {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: clearTexture must only be called in the start or update functions.")
        fatalError()
    }

    let cell = matrix.cellAt(row: row, column: column)
    if cell == nil {
        print("Warning: Tried to clear texture of cell which is out of range: row \(row), column \(column)")
        return
    }
    cell?.textureIndex = nil
}
