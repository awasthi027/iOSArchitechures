//
//  ViewController.swift
//  VIPER-demo
//
//  Created by Bipin on 6/29/18.
//  Copyright © 2018 Tootle. All rights reserved.
//

import UIKit
import iOSLoader
import iOSReachability
import iOSHTTPConnect

class NoticeViewController: UIViewController {

    var viewModel: NoticeViewModel = NoticeViewModel()
    @IBOutlet weak var uiTableView: UITableView!
  
    class func noticeViewController() -> NoticeViewController? {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: String(describing: NoticeViewController.self)) as? NoticeViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notice-Module"
        ReachabilityManager.shared.isEnableMessageView = true
        ReachabilityManager.shared.msgBgColor = .themeColor
        ReachabilityManager.shared.msgTextColor = .white
        self.uiTableView.delegate = self
        self.uiTableView.dataSource = self
        LoadingView.showMedium()
       weak var weakSelf = self
        viewModel.makeRequestToGetNoticeList { (isSuccess)  in
            if isSuccess {
                DispatchQueue.main.async {
                    weakSelf?.uiTableView.reloadData()
                }
            }
            DispatchQueue.main.async {
                LoadingView.dismiss()
            }
        }
    }
}


extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noticeList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieCell
        cell.viewModel.dataModel = viewModel.noticeList[indexPath.row]
        cell.configureDataOnCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}




