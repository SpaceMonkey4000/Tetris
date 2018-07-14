//
//  ViewController.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/14/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!

    private let tetris = Tetris()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let view = self.skView else {
            return
        }

        let scene = GameScene(size: CGSize(width: tetris.sceneWidth, height: tetris.sceneHeight))
        scene.scaleMode = .aspectFit
        view.presentScene(scene)

        // The documentation says that this provides better performance.
        view.ignoresSiblingOrder = true

        view.showsFPS = false
        view.showsNodeCount = false
    }

}
