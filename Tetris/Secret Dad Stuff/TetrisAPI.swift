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
public func setTexture(_ index: Int, x: Int, y: Int) {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: setTexture must only be called in the start or update functions.")
        fatalError()
    }

    let textureAtlasController: TextureAtlasController = TetrisManager.shared.textureAtlasController
    textureAtlasController.createIfNecessary()

    let cell = matrix.cellAt(x: x, y: y)
    if cell == nil {
        print("Warning: Tried to call setTexture on a cell which is out of range: x=\(x), y=\(y)")
        return
    }
    cell?.textureIndex = index
}

/// Clears the texture at a grid cell.
public func clearTexture(x: Int, y: Int) {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: clearTexture must only be called in the start or update functions.")
        fatalError()
    }

    let cell = matrix.cellAt(x: x, y: y)
    if cell == nil {
        print("Warning: Tried to call clearTexture on a cell which is out of range: x=\(x), y=\(y)")
        return
    }
    cell?.textureIndex = nil
}

/// Returns true if a texture exists at a grid cell.
public func hasTextureAt(x: Int, y: Int) -> Bool {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: textureAt must only be called in the start or update functions.")
        fatalError()
    }

    guard let cell = matrix.cellAt(x: x, y: y) else {
        return false
    }

    return cell.textureIndex != nil
}

/// Returns the texture at a grid cell. The program will crash if you call this with
/// the coordinates of a grid cell that has no texture.
public func textureAt(x: Int, y: Int) -> Int {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: textureAt must only be called in the start or update functions.")
        fatalError()
    }

    guard let cell = matrix.cellAt(x: x, y: y) else {
        print("Warning: Tried to call textureAt on a cell which is out of range: x=\(x), y=\(y)")
        fatalError()
    }

    guard let textureIndex = cell.textureIndex else {
        print("Warning: Tried to call textureAt on a cell which has no texture.")
        fatalError()
    }

    return textureIndex
}
