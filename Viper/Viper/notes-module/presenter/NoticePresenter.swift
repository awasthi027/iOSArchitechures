//
//  NoticePresenter.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit
import iOSHTTPConnect

class NoticePresenter: ViewToPresenterProtocal {
    
    func landOn(controller: NavigationControllerClass, navigationController: UINavigationController?) {
        router?.redirectOn(controller: controller, navigationController: navigationController)
    }
    func makeRequestToGetData(request: APIRequestType) {
        interactor?.startToRequestToGetData(request: request)
    }
    var view: PresenterToViewProtocal?
    
    var interactor: PresenterToInteractorProtocal?
    
    var router: PresenterToRouterProtocal?
    
}

extension NoticePresenter: InteractorToPresenterProtocal {
    func serviceResponse(_ result: APIResult<[String : Any]>, _ resultRequest: APIRequestType) {
        self.view?.seviceResponseToView(result, resultRequest)
    }
}

