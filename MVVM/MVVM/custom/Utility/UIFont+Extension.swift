//
//  UIFont+Extension.swift
//  MVP
//
//  Created by Ashish Awasthi on 26/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    static func baseThemeMediumFont(size: CGFloat) ->UIFont? {
        return  UIFont(name: "HelveticaNeue-Medium", size: size)
    }
    static func baseThemeLightFont(size: CGFloat) ->UIFont? {
        return  UIFont(name: "HelveticaNeue-Light", size: size)
    }
}
