//
//  NoticeProtocols.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    func showMovieController(navigationController:UINavigationController)
}

protocol PresenterToViewProtocol: class{
    func showNotice(noticeArray:[NoticeModel])
    func showError(_ error: Error?)
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> NoticeViewController?
    func pushToMovieScreen(navigationConroller:UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice()
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(noticeModelArray: [NoticeModel])
    func noticeFetchFailed(_ error: Error?)
}
