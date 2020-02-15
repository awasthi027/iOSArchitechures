//
//  MovieRouter.swift
//  Viper
//
//  Created by Ashish Awasthi on 15/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit

class UserRouter: PresenterToRouterProtocal {
    
   static func createModule(controller: NavigationControllerClass) ->UIViewController? {
        if let view = UserListViewController.userListViewController() {
            let presenter: ViewToPresenterProtocal & InteractorToPresenterProtocal = UserListPresenter()
            let interactor: PresenterToInteractorProtocal = UserListInteractor()
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
