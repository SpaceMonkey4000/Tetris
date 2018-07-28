//
//  Sound.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/28/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import AppKit

class Sound {

    let sound: NSSound

    init(named name: String) {
        guard let sound = NSSound(named: NSSound.Name(name)) else {
            print("Error loading sound:", name)
            fatalError()
        }
        self.sound = sound
    }

    func play() {
        sound.stop()
        sound.play()
    }

}
