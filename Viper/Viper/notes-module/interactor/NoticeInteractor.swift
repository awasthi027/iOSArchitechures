//
//  NoticeInteractor.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import iOSHTTPConnect

class NoticeInteractor: PresenterToInteractorProtocal {
    
    var presenter: InteractorToPresenterProtocal?
    func startToRequestToGetData(request: APIRequestType) {
        weak var weakSelf = self
        let requestForm = RequestForm.init(with: .eMovieInfo, api: .eNoticeList)
        ModelController.shared.processRequest(requestForm: requestForm, jsonObjType: NoticeInfo.self) { (result) in
            if let errorItem = result.error {
                weakSelf?.presenter?.serviceResponse(.failure(errorItem), request)
            }else {
                if result.isSuccess, let dict = result.value {
                    weakSelf?.presenter?.serviceResponse(.success(dict), request)
                }else {
                    weakSelf?.presenter?.serviceResponse(.success([kResponse: "No Reponse"]), request)
                }
            }
        }
    }
}
