//
//  UIColor+WebColor.swift
//  SR2
//
//  Created by Drew Olbrich on 7/10/16.
//  Copyright © 2016 Retroactive Fiasco. All rights reserved.
//

import Foundation
import AppKit

extension NSColor {

    public convenience init(webColor: String) {
        var string: String = webColor.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if string.hasPrefix("#") {
            string = String(string.dropFirst())
        }

        assert(string.count == 6, "UIColor hex string must have 6 digits.")

        var rgbValue: UInt32 = 0
        Scanner(string: string).scanHexInt32(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16)/255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8)/255.0,
            blue: CGFloat(rgbValue & 0x0000FF)/255.0,
            alpha: CGFloat(1.0)
        )
    }

}
