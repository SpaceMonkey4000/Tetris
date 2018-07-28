//
//  Label.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/28/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import SpriteKit

public class Label {

    private let labelNode: SKLabelNode

    private let defaultColor = "#ffffff"

    init() {
        labelNode = SKLabelNode()
        color = defaultColor
        isHidden = true
    }

    init(position: CGPoint, text: String?) {
        labelNode = SKLabelNode(fontNamed: "ARCADECLASSIC")

        guard let scene = TetrisManager.shared.scene else {
            print("Labels must be created inside the 'first' function.")
            fatalError()
        }

        let sceneSize = scene.size
        labelNode.position = CGPoint(
            x: position.x*sceneSize.height/2.0 + sceneSize.width*0.5,
            y: position.y*sceneSize.height/2.0 + sceneSize.height*0.5)

        labelNode.fontSize = 56.0
        labelNode.horizontalAlignmentMode = .left
        labelNode.verticalAlignmentMode = .baseline

        labelNode.text = text
        color = defaultColor

        isHidden = false

        scene.addChild(labelNode)
    }

    deinit {
        labelNode.removeFromParent()
    }

    var text: String? {
        didSet {
            labelNode.text = text
        }
    }

    var color: String {
        didSet {
            labelNode.fontColor = NSColor(webColor: color)
        }
    }

    var isHidden: Bool {
        didSet {
            labelNode.isHidden = isHidden
        }
    }

}
