//
//  KeyController.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Cocoa

class KeyController {

    private var pressedKeys = Set<Int>()

    public func keyDown(with event: NSEvent) {
        let key = Int(event.keyCode)
        pressedKeys.insert(key)
    }

    public func keyUp(with event: NSEvent) {
        let key = Int(event.keyCode)
        pressedKeys.remove(key)
    }

    public func keyIsPressed(_ key: Int) -> Bool {
        return pressedKeys.contains(key)
    }

}
