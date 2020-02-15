//
//  ViperProtocals.swift
//  Viper
//
//  Created by Ashish Awasthi on 15/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit
import iOSHTTPConnect

public enum NavigationControllerClass: String {
  case noticeVC = "NoticeViewController"
  case movieVC = "MovieListViewController"
}

protocol ViewToPresenterProtocal: class {
    var view: PresenterToViewProtocal? {get set}
    var interactor: PresenterToInteractorProtocal? {get set}
    var router: PresenterToRouterProtocal? {get set}
    func makeRequestToGetData(request: APIRequestType)
    func landOn(controller: NavigationControllerClass, navigationController: UINavigationController?)
}

protocol InteractorToPresenterProtocal: class {
    func serviceResponse(_ result: APIResult<[String: Any]>, _ resultRequest: APIRequestType)
}

protocol PresenterToInteractorProtocal: class {
    var presenter: InteractorToPresenterProtocal? {get set}
    func startToRequestToGetData(request: APIRequestType)
}

protocol PresenterToViewProtocal: class {
    func seviceResponseToView(_ result: APIResult<[String: Any]>, _ resultRequest:APIRequestType)
}

protocol PresenterToRouterProtocal {
   static func createModule(controller: NavigationControllerClass) ->UIViewController?
   func redirectOn(controller: NavigationControllerClass, navigationController: UINavigationController?)
}
