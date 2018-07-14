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

    private var matrix: Matrix!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let view = self.skView else {
            return
        }

        let tetris = TetrisManager.shared.tetris

        let scene = GameScene(size: CGSize(width: CGFloat(tetris.matrixColumns)*Cell.size.width, height: CGFloat(tetris.matrixRows)*Cell.size.height))
        scene.scaleMode = .aspectFit
        view.presentScene(scene)

        // The documentation says that this provides better performance.
        view.ignoresSiblingOrder = true

        view.showsFPS = false
        view.showsNodeCount = false

        matrix = Matrix()
    }

}
