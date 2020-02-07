//
//  NoticeInteractor.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import iOSHTTPConnect

class NoticeInteractor: PresenterToInteractorProtocol {
    
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNotice() {
        weak var weakSelf = self
        let requestForm = RequestForm.init(with: .eMovieInfo, api: .eNoticeList)
        ModelController.shared.processRequest(requestForm: requestForm, jsonObjType: NoticeInfo.self) { (result) in
            if let errorItem = result.error {
                weakSelf?.presenter?.noticeFetchFailed(errorItem)
            }else {
                if result.isSuccess, let dict = result.value, let noticeInfo = dict[kResponse] as? NoticeInfo {
                    weakSelf?.presenter?.noticeFetchedSuccess(noticeModelArray: noticeInfo.noticeList)
                }else {
                     weakSelf?.presenter?.noticeFetchFailed(nil)
                }
            }
        }
    }
}
