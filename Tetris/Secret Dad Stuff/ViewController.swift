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

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let view = self.skView else {
            return
        }

        let tetris = Tetris()
        TetrisManager.shared.tetris = tetris

        let scene = Scene(size: CGSize(width: CGFloat(tetris.matrixColumns)*Cell.size.width, height: (CGFloat(tetris.matrixRows) - CGFloat(tetris.hiddenMatrixRows))*Cell.size.height))
        scene.scaleMode = .aspectFit
        view.presentScene(scene)

        TetrisManager.shared.scene = scene

        // The documentation says that this provides better performance.
        view.ignoresSiblingOrder = true

        view.showsFPS = false
        view.showsNodeCount = false

        assert(TetrisManager.shared.scene != nil)
        let matrix = Matrix()
        TetrisManager.shared.matrix = matrix

        matrix.layoutCells()
    }

}
