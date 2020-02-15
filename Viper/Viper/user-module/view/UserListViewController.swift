//
//  MovieListViewController.swift
//  Viper
//
//  Created by Ashish Awasthi on 15/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import UIKit
import iOSHTTPConnect
import iOSLoader

class UserListViewController: UIViewController {
     var presenter: ViewToPresenterProtocal?
    class func userListViewController() -> UserListViewController? {
           let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
           return storyBoard.instantiateViewController(withIdentifier: String(describing: UserListViewController.self)) as? UserListViewController
       }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User-Module"
        presenter?.makeRequestToGetData(request: .eUsersList)
    }
}

extension UserListViewController: PresenterToViewProtocal {
    func seviceResponseToView(_ result: APIResult<[String : Any]>, _ resultRequest: APIRequestType) {
         DispatchQueue.main.async {
             LoadingView.dismiss()
         }
         if let dict = result.value, let userInfo = dict[kResponse] as? UserProfileInfo  {
            // self.noticeArrayList = notificeInfo.noticeList
             DispatchQueue.main.async {
               //  self.uiTableView.reloadData()
             }
         }else {
             
         }
     }
}
