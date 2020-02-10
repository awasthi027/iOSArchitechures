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
        let requestForm = RequestForm.init(with: .eMyAccount, api: .eUsersList)
        ModelController.shared.processRequest(requestForm: requestForm, jsonObjType: UserProfileList.self) { (result) in
            if let errorItem = result.error as NSError? {
                if  let userProfileList = MyAccountServiceDao.listOfUsers(), errorItem.code == 10004 {// No Internet code
                    complete(userProfileList, nil)
                }else {
                    complete(nil, nil)
                }
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

