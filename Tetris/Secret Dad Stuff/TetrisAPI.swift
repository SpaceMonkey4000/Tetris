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

public func createTextureAtlasControllerIfNecessary() {
    let textureAtlasController: TextureAtlasController = TetrisManager.shared.textureAtlasController
    textureAtlasController.createIfNecessary()
}

/// Adds a texture with a name of an image in the asset catalog.
public func texture(named name: String) -> Int {
    guard TetrisManager.shared.matrix == nil else {
        print("Error: texture(named:) must not be called in the first or update functions.")
        fatalError()
    }

    guard let image = NSImage(named: NSImage.Name(name)) else {
        print("Could not find image in asset catalog: \(name)")
        fatalError()
    }

    return TetrisManager.shared.textureAtlasController.addTexture(name: name, image: image)
}

/// Assigns a background texture that appears in each cell when it is cleared
/// with clearTexture, or with setTexture with an argument of 0.
public func setBackgroundTexture(_ backgroundTexture: Int) {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: setBackgroundTexture must only be called in the first or update functions.")
        fatalError()
    }

    createTextureAtlasControllerIfNecessary()
    
    matrix.defaultTextureIndex = backgroundTexture
}

/// Sets a texture at a grid cell. If 0 is specified for the texture,
/// the cell's texture is cleared.
public func setTexture(_ index: Int, x: Int, y: Int) {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: setTexture must only be called in the first or update functions.")
        fatalError()
    }

    createTextureAtlasControllerIfNecessary()

    let cell = matrix.cellAt(x: x, y: y)
    if cell == nil {
        // print("Warning: Tried to call setTexture on a cell which is out of range: x=\(x), y=\(y)")
        return
    }
    if index == 0 {
        // This matches the behavior of clearTexture.
        cell?.textureIndex = nil
    } else {
        cell?.textureIndex = index
    }
}

/// Clears the texture at a grid cell.
public func clearTexture(x: Int, y: Int) {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: clearTexture must only be called in the first or update functions.")
        fatalError()
    }

    let cell = matrix.cellAt(x: x, y: y)
    if cell == nil {
//        print("Warning: Tried to call clearTexture on a cell which is out of range: x=\(x), y=\(y)")
        return
    }
    cell?.textureIndex = nil
}

/// Returns true if a texture exists at a grid cell.
public func hasTextureAt(x: Int, y: Int) -> Bool {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: textureAt must only be called in the first or update functions.")
        fatalError()
    }

    guard let cell = matrix.cellAt(x: x, y: y) else {
        return false
    }

    return cell.textureIndex != nil
}

/// Returns the texture at a grid cell. Returns 0 if the cell has no texture.
public func textureAt(x: Int, y: Int) -> Int {
    guard let matrix = TetrisManager.shared.matrix else {
        print("Error: textureAt must only be called in the first or update functions.")
        fatalError()
    }

    guard let cell = matrix.cellAt(x: x, y: y) else {
        // print("Warning: Tried to call textureAt on a cell which is out of range: x=\(x), y=\(y)")
        return 0
    }

    guard let textureIndex = cell.textureIndex else {
        return 0
    }

    return textureIndex
}

public func keyIsPressed(_ key: Int) -> Bool {
    return TetrisManager.shared.keyController.keyIsPressed(key)
}

public func random(min: Int, max: Int) -> Int {
    if min > max {
        print("Error: Invalid random number range: min=\(min), max=\(max)")
    }
    return Int(arc4random()) % (max - min + 1) + min
}

/// Returns a new grid of cells,
/// - Parameters:
///     - cellsX: The width of the grid, in cells.
///     - cellsY: The height of the grid, in cells.
///     - center: The center of the grid as a CGPoint, in normalized coordinates, where -1 to 1
///         extends from the bottom of the window to the top of the window.
///     - scale: The scale of the cells, relative to the default grid. 0.5 indicates
///         half height cells.
public func createGrid(cellsX: Int, cellsY: Int, center: CGPoint, scale: GGFloat) -> Grid {
    return Grid(cellsX: cellsX, cellsY: cellsY, center: center, scale: scale)
}
