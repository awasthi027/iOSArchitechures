//
//  MovieListPresenter.swift
//  Viper
//
//  Created by Ashish Awasthi on 15/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit
import iOSHTTPConnect

class UserListPresenter: ViewToPresenterProtocal {
     var view: PresenterToViewProtocal?
     var interactor: PresenterToInteractorProtocal?
     var router: PresenterToRouterProtocal?
    
    func makeRequestToGetData(request: APIRequestType) {
        self.interactor?.startToRequestToGetData(request: request)
    }
    func landOn(controller: NavigationControllerClass, navigationController: UINavigationController?) {
        self.router?.redirectOn(controller: controller, navigationController: navigationController)
    }
}

extension UserListPresenter: InteractorToPresenterProtocal {
    func serviceResponse(_ result: APIResult<[String : Any]>, _ resultRequest: APIRequestType) {
        self.view?.seviceResponseToView(result, resultRequest)
    }
}
