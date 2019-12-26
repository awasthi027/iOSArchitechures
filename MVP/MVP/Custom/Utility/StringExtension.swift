//
//  StringExtension.swift
//  Neva
//
//  Created by Tanuja Awasthi on 01/12/18.
//  Copyright © 2018 Tanuja Awasthi. All rights reserved.
//

import Foundation

extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
   
}
