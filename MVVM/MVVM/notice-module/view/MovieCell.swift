//
//  MovieCell.swift
//  MVVM
//
//  Created by Ashish Awasthi on 16/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import UIKit
import ImageCacheiOS

class MovieCell: UITableViewCell{
    @IBOutlet weak var mImageView: UIImageView!
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mDescription: UILabel!
    var viewModel: MovieCellVM = MovieCellVM()
    
    func configureDataOnCell() {
        guard let model = viewModel.dataModel else {
            FSLogInfo("Movie cell data model is nil")
            return
        }
        self.mTitle.text = model.title
        self.mDescription.text = model.brief
        if let urlItem = model.imageUrl, let url = URL.init(string: urlItem) {
        self.mImageView.setImage(withUrl: url, placeholder: nil, crossFadePlaceholder: false, cacheScaled: true) { (imageInstance, error) in
            }
        }
    }
}
