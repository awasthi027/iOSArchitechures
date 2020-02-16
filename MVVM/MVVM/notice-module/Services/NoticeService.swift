//
//  UserProfileService.swift
//  MVP
//
//  Created by Ashish Awasthi on 26/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation
import iOSHTTPConnect

struct NoticeService {
    
    static func noticeList(complete: @escaping(_ userProfileList: NoticeInfo?, _ error: Error?) ->Void) {
        let requestForm = RequestForm.init(with: .eMovieInfo, api: .eNoticeList)
        ModelController.shared.processRequest(requestForm: requestForm, jsonObjType: NoticeInfo.self) { (result) in
            if let errorItem = result.error as NSError? {
                if  let userProfileList = NoticeServiceDao.listOfNotice(), errorItem.code == 10004 {// No Internet code
                    complete(userProfileList, nil)
                }else {
                    complete(nil, errorItem)
                }
                complete(nil, errorItem)
            }else {
                if result.isSuccess, let dict = result.value, let noticeItem = dict[kResponse] as? NoticeInfo {
                    // Save data in core data
                    DispatchQueue.main.async {
                        NoticeTable.saveUserNoticInfo(with:  noticeItem.noticeList)
                    }
                    complete(noticeItem, nil)
                }else {
                    complete(nil, nil)
                }
            }
        }
    }
}

