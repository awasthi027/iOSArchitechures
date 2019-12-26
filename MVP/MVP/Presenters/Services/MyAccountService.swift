//
//  UserProfileService.swift
//  MVP
//
//  Created by Ashish Awasthi on 26/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation
import iOSHTTPConnect

struct MyAccountService {
    
    static func userProfileInfo(complete: @escaping(_ userProfileList: UserProfileList?, _ error: Error?) ->Void) {
        if ReachabilityManager.shared.isNetworkAvailable == false {
            SharedApplication.shared.noNetworkView.showNoInterNetConnectionMessage()
            if let userProfileList = MyAccountServiceDao.listOfUsers() {
                complete(userProfileList, nil)
            }else {
              complete(nil, nil)
            }
            return
        }
        let requestForm = RequestForm.init(with: .eMyAccount, api: .eUsersList, postParam: [:])
        ModelController.shared.processRequest(requestForm: requestForm, jsonObjType: UserProfileList.self) { (result) in
            if let errorItem = result.error {
                complete(nil, errorItem)
            }else {
                if result.isSuccess, let dict = result.value, let profileList = dict[kResponse] as? UserProfileList {
                    // Save data in core data
                    DispatchQueue.main.async {
                        UserProfileTable.saveUserProfileInfo(with:  profileList.list)
                    }
                    complete(profileList, nil)
                }else {
                    complete(nil, nil)
                }
            }
        }
    }
}

