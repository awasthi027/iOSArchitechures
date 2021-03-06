//
//  NoticeRouter.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter: PresenterToRouterProtocal {
    
   static func createModule(controller: NavigationControllerClass) ->UIViewController? {
        if let view = NoticeViewController.noticeViewController() {
            let presenter: ViewToPresenterProtocal & InteractorToPresenterProtocal = NoticePresenter()
            let interactor: PresenterToInteractorProtocal = NoticeInteractor()
            let router: PresenterToRouterProtocal = NoticeRouter()
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            return view
        }
        return nil
    }
    
    func redirectOn(controller: NavigationControllerClass, navigationController: UINavigationController?) {
        if let nav = navigationController, let item = UserRouter.createModule(controller: controller) {
            nav.pushViewController(item, animated: true)
        }
    }
}
