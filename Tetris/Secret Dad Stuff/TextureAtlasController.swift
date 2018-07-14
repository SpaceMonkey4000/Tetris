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

    public private(set) var textureAtlas: SKTextureAtlas!

    private var nameToImageDictionary: [String : Any] = [:]
    private var indexToNameDictionary: [Int : String] = [:]

    private var indexToTextureArray: [SKTexture] = []

    private var indexCount = 0

    public func addTexture(name: String, image: NSImage) -> Int {
        let index = indexCount

        nameToImageDictionary[name] = image
        indexToNameDictionary[index] = name
        indexCount += 1

        return index
    }

    public func create() {
        textureAtlas = SKTextureAtlas(dictionary: nameToImageDictionary)

        for index in 0..<indexCount {
            guard let name = indexToNameDictionary[index] else {
                fatalError()
            }
            indexToTextureArray.append(textureAtlas.textureNamed(name))
        }
    }

    public func texture(withIndex index: Int) -> SKTexture {
        assert(index >= 0 && index < indexToTextureArray.count)
        return indexToTextureArray[index]
    }

}
