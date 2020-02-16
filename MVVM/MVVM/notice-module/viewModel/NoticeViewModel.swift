//
//  NoticeViewModel.swift
//  MVVM
//
//  Created by Ashish Awasthi on 16/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation

class NoticeViewModel: NSObject {
    
    var noticeList: [NoticeModel] = []
    
    func makeRequestToGetNoticeList(completed: @escaping(_ isSucess: Bool)->Void) {
        weak var weakSelf = self
        NoticeService.noticeList { (noticeInfo, error) in
            if let noticeItem = noticeInfo {
                weakSelf?.noticeList = noticeItem.noticeList
                completed(true)
            }else {
                completed(false)
            }
        }
    }
}
