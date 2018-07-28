//
//  WindowController.swift
//  Tetris
//
//  Created by Drew Olbrich on 7/28/18.
//  Copyright © 2018 Retroactive Fiasco. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

        assert(window != nil)

        window?.styleMask = [.titled, .resizable, .miniaturizable]
        window?.titleVisibility = .visible
        window?.title = "Tetris"

        let width: CGFloat = 640.0
        let height: CGFloat = 480.0

        window?.setContentSize(CGSize(width: width, height: height))

        window?.contentAspectRatio = NSSize(width: 1.0, height: height/width)
    }

    override func windowTitle(forDocumentDisplayName displayName: String) -> String {
        return "Tetris"
    }

}
