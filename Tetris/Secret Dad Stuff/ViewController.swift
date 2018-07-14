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

        TetrisManager.shared.tetris = Tetris()

        initScene()

        initView()

        initMatrix()

        let matrix: Matrix = TetrisManager.shared.matrix
        matrix.layoutCells()
    }

    private func initScene() {
        let tetris: Tetris = TetrisManager.shared.tetris

        let scene = Scene(size: CGSize(width: CGFloat(tetris.matrixColumns)*Cell.size.width, height: (CGFloat(tetris.matrixRows) - CGFloat(tetris.hiddenMatrixRows))*Cell.size.height))
        scene.scaleMode = .aspectFit
        skView.presentScene(scene)

        TetrisManager.shared.scene = scene
    }

    private func initView() {
        // The documentation says that this provides better performance.
        skView.ignoresSiblingOrder = true

        skView.showsFPS = false
        skView.showsNodeCount = false
    }

    private func initMatrix() {
        assert(TetrisManager.shared.scene != nil)
        let matrix = Matrix()
        TetrisManager.shared.matrix = matrix
    }

}
