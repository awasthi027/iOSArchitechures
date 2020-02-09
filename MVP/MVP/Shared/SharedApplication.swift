//
//  SharedApplication.swift
//  MVP
//
//  Created by Ashish Awasthi on 26/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation
import UIKit

class SharedApplication {
       static let shared = SharedApplication()
       var token: String = ""
       var reachability: Reachability?
       let noNetworkView: CustomNoNetworkView = CustomNoNetworkView.init(frame:  CGRect(x: xPosition, y: CustomNoNetworkView.yPositionOfLabel(withDirection: .eTop), width: (UIScreen.main.bounds.size.width - 2*xPosition) , height: NavigationViewHeight))
       private init() {}
       deinit { }
       func setupReachability(_ hostName: String?, useClosures: Bool) {
           let reachability: Reachability?
           if let hostName = hostName {
               reachability = Reachability(hostname: hostName)
           } else {
               reachability = Reachability()
           }
           self.reachability = reachability
       }
}
