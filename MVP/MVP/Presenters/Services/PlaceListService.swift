//
//  PhotoListService.swift
//  MVP
//
//  Created by Ashish Awasthi on 22/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation
import iOSHTTPConnect

struct PlaceListService {
    
    static func listOfPlaces(complete: @escaping(_ placeInfo: PlaceInfo?, _ error: Error?) ->Void) {
        let requestForm = RequestForm.init(with: .ePlaces, api: .ePlaceList, postParam: [:])
        ModelController.shared.processRequest(requestForm: requestForm, jsonObjType: PlaceInfo.self) { (result) in
            if let errorItem = result.error {
                complete(nil, errorItem)
            }else {
                if result.isSuccess, let dict = result.value, let placeInfo = dict[kResponse] as? PlaceInfo {
                    complete(placeInfo, nil)
                }else {
                    complete(nil, nil)
                }
            }
        }
    }
}
