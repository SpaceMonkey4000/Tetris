//
//  Scene.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import SpriteKit
import GameplayKit

private func callGlobalUpdate() {
    update()
}

class Scene: SKScene {

    public var viewHasAppeared = false

    override func didMove(to view: SKView) {
        // Do nothing.
    }

    override func keyDown(with event: NSEvent) {
        let key = Int(event.keyCode)
        let keyWasAlreadyPressed = TetrisManager.shared.keyController.keyIsPressed(key)

        TetrisManager.shared.keyController.keyDown(with: event)

        if !keyWasAlreadyPressed {
            keyPress(key: key)
        }
    }

    override func keyUp(with event: NSEvent) {
        TetrisManager.shared.keyController.keyUp(with: event)
    }

    override func update(_ currentTime: TimeInterval) {
        if viewHasAppeared {
            callGlobalUpdate()
        }
    }

}
