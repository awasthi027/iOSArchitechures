//
//  NoticeRouter.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit

class NoticeRouter: PresenterToRouterProtocol {
    
    static func createModule() -> NoticeViewController? {
        if let view = NoticeViewController.noticeViewController() {
            let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = NoticePresenter()
            let interactor: PresenterToInteractorProtocol = NoticeInteractor()
            let router:PresenterToRouterProtocol = NoticeRouter()
            view.presentor = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            return view
        }
        return nil
    }
    
    func pushToMovieScreen(navigationConroller: UINavigationController) {
        // Push here
        //1. Create Module
        //  let movieModue = MovieRouter.createMovieModule()
             // navigationController.pushViewController(movieModue,animated: true)
    }
}
