//
//  MyAccountPresenter.swift
//  MVP
//
//  Created by Ashish Awasthi on 26/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation

class MyMyAccountPresenter {
    
    var userProfileList: UserProfileList = UserProfileList.init()
    func usersList(complete: @escaping(_ isSuccess: Bool) ->Void) {
        weak var weakSelf = self
        MyAccountService.userProfileInfo { (userProfileList, error) in
            if let item = userProfileList {
                weakSelf?.userProfileList = item
                complete(true)
            }else {
                complete(false)
            }
        }
    }
    
    
}
