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

        initGrid()
    }

    override func viewDidAppear() {
        super.viewDidAppear()

        first()

        let scene: Scene = TetrisManager.shared.scene
        scene.viewHasAppeared = true
    }

    private func initScene() {
        // The aspect ratio of the scene, as width/height. We want the scene to be
        // as least as wide as we expect the user to resize the window.
        let sceneAspectRatio: CGFloat = 2.7
        
        let sceneHeight: CGFloat = CGFloat(gridSizeY) - CGFloat(hiddenMatrixRows)
        let sceneWidth: CGFloat = sceneHeight*sceneAspectRatio
        
        let sceneSizeInCells = CGSize(width: sceneWidth, height: sceneHeight)        

        let sceneSizeInPoints = CGSize(width: sceneSizeInCells.width*Cell.size.width, 
                                      height: sceneSizeInCells.height*Cell.size.height)                          
                                  
        let scene = Scene(size: sceneSizeInPoints)
        scene.scaleMode = .aspectFill

        skView.presentScene(scene)

        TetrisManager.shared.scene = scene
    }

    private func initView() {
        // The documentation says that this provides better performance.
        skView.ignoresSiblingOrder = true

        skView.showsFPS = false
        skView.showsNodeCount = false
    }

    private func initGrid() {
        guard let scene = TetrisManager.shared.scene else {
            assertionFailure()
            return
        }

        // Shift the matrix up so that its bottom edge (y = 0) is flush with
        // the bottom of the window.
        let cellsToNormalizedCoordinatesRatio: CGFloat = Cell.size.height/(scene.size.height/2.0)
        let center = CGPoint(x: 0.0, y: CGFloat(hiddenMatrixRows)/2.0*cellsToNormalizedCoordinatesRatio)

        // We use the default matrix to define the base scale of every other matrix in the scene.
        let scale: CGFloat = 1.0

        TetrisManager.shared.grid = createGrid(cellsX: gridSizeX, cellsY: gridSizeY, centerX: Float(center.x), centerY: Float(center.y), scale: scale)
    }

}
