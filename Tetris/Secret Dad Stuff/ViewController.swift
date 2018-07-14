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

    // Width and height of each cell, in pixels.
    private let cellSize = CGSize(width: 16.0, height: 16.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let view = self.skView else {
            return
        }

        let scene = GameScene(size: CGSize(width: CGFloat(tetris.matrixWidth)*cellSize.width, height: CGFloat(tetris.matrixHeight)*cellSize.height))
        scene.scaleMode = .aspectFit
        view.presentScene(scene)

        // The documentation says that this provides better performance.
        view.ignoresSiblingOrder = true

        view.showsFPS = false
        view.showsNodeCount = false
    }

}
