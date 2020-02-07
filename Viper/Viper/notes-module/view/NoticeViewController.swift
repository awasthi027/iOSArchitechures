//
//  ViewController.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import UIKit
import iOSLoader
import ImageCacheiOS
import iOSReachability

class NoticeViewController: UIViewController {

    var presentor:ViewToPresenterProtocol?
    
    @IBOutlet weak var uiTableView: UITableView!
    var noticeArrayList: [NoticeModel] = []
    
    class func noticeViewController() -> NoticeViewController? {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: String(describing: NoticeViewController.self)) as? NoticeViewController
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Notice-Module"
        ReachabilityManager.shared.isEnableMessageView = true
        presentor?.startFetchingNotice()
        LoadingView.showMedium()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        
        }
}

extension NoticeViewController:PresenterToViewProtocol {
    
    func showNotice(noticeArray: [NoticeModel]) {
        self.noticeArrayList = noticeArray
        DispatchQueue.main.async {
            self.uiTableView.reloadData()
            LoadingView.dismiss()
        }
    }
    
    func showError(_ error: Error?) {
        DispatchQueue.main.async {
          LoadingView.dismiss()
        }
    }
}

extension NoticeViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticeArrayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.mTitle.text = noticeArrayList[indexPath.row].title
        cell.mDescription.text = noticeArrayList[indexPath.row].brief
        if let urlItem = noticeArrayList[indexPath.row].imageUrl, let url = URL.init(string: urlItem) {
        cell.mImageView.setImage(withUrl: url, placeholder: nil, crossFadePlaceholder: false, cacheScaled: true) { (imageInstance, error) in

            }
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presentor?.showMovieController(navigationController: navigationController!)

    }
    
    
}

class MovieCell:UITableViewCell{
    
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
    
}




