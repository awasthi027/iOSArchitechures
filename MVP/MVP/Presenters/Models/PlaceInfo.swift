//
//  PlaceInfo.swift
//  Travel
//
//  Created by Ashish Awasthi on 04/09/19.
//  Copyright © 2019 Ashish Awasthi. All rights reserved.
//

import Foundation

/* Place infomation
 ** Like place name, place description, image
 */

struct Place: Decodable {
    
    var title: String?
    var description: String?
    var imageHref: String?
    enum CodingKeys: String, CodingKey {
        case title,description,imageHref
    }
    
    public  init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? " "
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? " "
        imageHref = try container.decodeIfPresent(String.self, forKey: .imageHref) ?? " "
    }
}

struct PlaceInfo: Decodable {
    
    var title: String = ""
    var list: [Place] = []
    enum CodingKeys: String, CodingKey {
        case title
        case list = "rows"
    }
     public  init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        list = try container.decode([Place].self, forKey: .list)
    }
}
extension PlaceInfo {
    init(title: String = "", list: [Place] = []) {
        
    }
}
