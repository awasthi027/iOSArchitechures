//
//  MovieInfo.swift
//  Viper
//
//  Created by Ashish Awasthi on 15/02/20.
//  Copyright © 2020 Ashish Awasthi. All rights reserved.
//

import Foundation

struct UserProfileList: Decodable  {
    var list: [UserProfileInfo] = []
    enum CodingKeys: String, CodingKey {
        case list = "data"
    }
    init(with list: [UserProfileInfo] = []) {
        self.list = list
    }
}


struct UserProfileInfo: Decodable {
    var userId: Int16?
    var name: String?
    var skills: String? = ""
    var imageUrl: String? = ""
    enum CodingKeys: String, CodingKey {
        case name, skills
        case userId = "id"
        case imageUrl = "image"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decodeIfPresent(Int16.self, forKey: .userId)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        skills = try container.decodeIfPresent(String.self, forKey: .skills)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
    }
}

extension UserProfileInfo {
    
    static func getUserProfileList(with json: Any) -> [UserProfileInfo]? {
        
        if let items = json as? [Any] {
            var list = [UserProfileInfo]()
            for alertDict in items {
                guard let data = try? JSONSerialization.data(withJSONObject: alertDict, options: .prettyPrinted) else { continue }
                guard let alert = try? JSONDecoder().decode(UserProfileInfo.self, from: data) else { continue }
                list.append(alert)
            }
            return list
        }
        return nil
    }
}
