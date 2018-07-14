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

    private let textureAtlasController = TextureAtlasController()

    override func viewDidLoad() {
        super.viewDidLoad()

        initScene()

        initView()

        initMatrix()
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        first()

        let scene: Scene = TetrisManager.shared.scene
        scene.viewHasAppeared = true
    }

    private func initScene() {
        let scene = Scene(size: CGSize(width: CGFloat(gridSizeX)*Cell.size.width, height: (CGFloat(gridSizeY) - CGFloat(hiddenMatrixRows))*Cell.size.height))
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

        matrix.layoutCells()
    }

}
