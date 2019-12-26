//
//  PlaceListViewController.swift
//  MVP
//
//  Created by Ashish Awasthi on 25/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let presenter = PlaceListPresenter()
    let myAccountPresenter = MyMyAccountPresenter()
   class func viewController() -> ViewController? {
         let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
         return storyBoard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
     }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        /* presenter.listOfPlaces { (isSuccess) in
        } */
        myAccountPresenter.usersList { (isSuccess) in
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
