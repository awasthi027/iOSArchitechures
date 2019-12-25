//
//  PhotoListPresenter.swift
//  MVP
//
//  Created by Ashish Awasthi on 22/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation

class PlaceListPresenter {
    var placeInfo: PlaceInfo = PlaceInfo.init()
    func listOfPlaces(complete: @escaping(_ isSuccess: Bool) ->Void) {
         weak var weakSelf = self
        PlaceListService.listOfPlaces { (place, error) in
            if let placeItem = place {
                weakSelf?.placeInfo = placeItem
                complete(true)
            }else {
                complete(false)
            }
        }
    }
}
