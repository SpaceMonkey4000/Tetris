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

    private var indexCount = 0

    public func addTexture(name: String, image: NSImage) -> Int {
        print("Adding texture: \(name)")

        let index = indexCount

        nameToImageDictionary[name] = image
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

        for index in 0..<indexCount {
            guard let name = indexToNameDictionary[index] else {
                print("Error: Could not find texture with index: \(index)")
                fatalError()
            }
            indexToTextureArray.append(textureAtlas!.textureNamed(name))
        }
    }

    public func texture(withIndex index: Int) -> SKTexture? {
        guard index >= 0 && index < indexToTextureArray.count else {
            return nil
        }
        return indexToTextureArray[index]
    }

}
