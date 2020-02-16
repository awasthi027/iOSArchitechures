//
//  UIColor+SprintPalette.swift
//  Neva
//
//  Created by Tanuja Awasthi on 01/12/18.
//  Copyright © 2018 Tanuja Awasthi. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(hex: String) {
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")

        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #

        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)

        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb &   0xFF00) >>  8) / 255.0,
            blue:  CGFloat((rgb &     0xFF)      ) / 255.0,
            alpha: 1)
    }

    static let sunflowerYellow = UIColor(hex: "#ffcd00")
    
    static let themeColor = UIColor(red: 206.0/255.0, green: 23.0/255.0, blue: 39.0/255.0, alpha: 1.0)
    
    static let navigationTitleColor = UIColor.white

}
