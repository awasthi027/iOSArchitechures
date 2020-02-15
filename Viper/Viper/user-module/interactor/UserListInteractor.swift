//
//  MovieListInteractor.swift
//  Viper
//
//  Created by Ashish Awasthi on 15/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import iOSHTTPConnect

class UserListInteractor: PresenterToInteractorProtocal {
    var presenter: InteractorToPresenterProtocal?
    func startToRequestToGetData(request: APIRequestType) {
        weak var weakSelf = self
        let requestForm = RequestForm.init(with: .eMyAccount, api: .eUsersList)
        ModelController.shared.processRequest(requestForm: requestForm, jsonObjType: UserProfileInfo.self) { (result) in
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
