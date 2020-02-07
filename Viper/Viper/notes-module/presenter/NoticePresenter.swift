//
//  NoticePresenter.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit

class NoticePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingNotice() {
        interactor?.fetchNotice()
    }
    func showMovieController(navigationController: UINavigationController) {
        router?.pushToMovieScreen(navigationConroller:navigationController)
    }
    
}
extension NoticePresenter: InteractorToPresenterProtocol {
    
    func noticeFetchedSuccess(noticeModelArray: [NoticeModel]) {
        view?.showNotice(noticeArray: noticeModelArray)
    }
    
    func noticeFetchFailed(_ error: Error?) {
        view?.showError(error)
    }
}
