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
import iOSHTTPConnect

class NoticeViewController: UIViewController {

    var presenter: ViewToPresenterProtocal?
    
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
        presenter?.makeRequestToGetData(request:.eNoticeList)
        LoadingView.showMedium()
        uiTableView.delegate = self
        uiTableView.dataSource = self
        }
}

extension NoticeViewController:PresenterToViewProtocal {
    func seviceResponseToView(_ result: APIResult<[String : Any]>, _ resultRequest: APIRequestType) {
        DispatchQueue.main.async {
            LoadingView.dismiss()
        }
        if let dict = result.value, let notificeInfo = dict[kResponse] as? NoticeInfo  {
            self.noticeArrayList = notificeInfo.noticeList
            DispatchQueue.main.async {
                self.uiTableView.reloadData()
            }
        }else {
            
        }
    }
}

extension NoticeViewController:UITableViewDelegate, UITableViewDataSource {
    
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
        presenter?.landOn(controller: .movieVC, navigationController: self.navigationController)
    }
}

class MovieCell:UITableViewCell{
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
    
}




