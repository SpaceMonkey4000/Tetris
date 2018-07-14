//
//  Scene.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import SpriteKit
import GameplayKit

class Scene: SKScene {

    public var viewHasAppeared = false

    override func didMove(to view: SKView) {
        // Do nothing.
    }

    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let tetris: Tetris = TetrisManager.shared.tetris

        if viewHasAppeared {
            tetris.update()
        }
    }

}
