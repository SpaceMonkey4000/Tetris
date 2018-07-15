//
//  TextureAtlasController.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Cocoa
import SpriteKit

class TextureAtlasController {

    public private(set) var textureAtlas: SKTextureAtlas?

    private var nameToImageDictionary: [String : Any] = [:]
    private var indexToNameDictionary: [Int : String] = [:]

    private var indexToTextureArray: [SKTexture] = []

    // We start with index 1, since index 0 represents the absence of a texture.
    private var indexCount = 1

    public func addTexture(name: String, image: NSImage) -> Int {
        print("Adding texture: \(name)")

        let index = indexCount

        nameToImageDictionary[name] = image.resized(to: NSSize(width: Cell.size.width, height: Cell.size.width))
        indexToNameDictionary[index] = name
        indexCount += 1

        return index
    }

    public func createIfNecessary() {
        if textureAtlas == nil {
            create()
        }
    }

    private func create() {
        print("Creating texture atlas.")

        textureAtlas = SKTextureAtlas(dictionary: nameToImageDictionary)

        // We skip 0 because it does not correspond to a texture.
        for index in 1..<indexCount {
            guard let name = indexToNameDictionary[index] else {
                print("Error: Could not find texture with index: \(index)")
                fatalError()
            }
            indexToTextureArray.append(textureAtlas!.textureNamed(name))
        }
    }

    public func texture(withIndex index: Int) -> SKTexture? {
        let index = index - 1

        guard index >= 0 && index < indexToTextureArray.count else {
            return nil
        }
        return indexToTextureArray[index]
    }

}
