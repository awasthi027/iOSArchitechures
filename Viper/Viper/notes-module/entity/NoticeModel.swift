//
//  NoticeModel.swift
//  Viper
//
//  Created by Ashish Awasthi on 06/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation

struct NoticeInfo: Decodable {
    var isSuccess: Bool = false
    var noticeList: [NoticeModel] = []
    
    enum CodingKeys: String, CodingKey {
        case isSuccess = "success"
        case noticeList = "movie_list"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        isSuccess = try container.decode(Bool.self, forKey: .isSuccess)
        noticeList = try container.decode([NoticeModel].self, forKey: .noticeList)
    }
}

struct NoticeModel: Decodable {
    var idNumber: String?
    var title: String?
    var brief: String?
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case idNumber = "id"
        case title = "title"
        case brief = "brief"
        case imageUrl = "image_url"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        idNumber = try container.decodeIfPresent(String.self, forKey: .idNumber)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        brief = try container.decodeIfPresent(String.self, forKey: .brief)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}
