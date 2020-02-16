//
//  UserProfileServiceDao.swift
//  MVP
//
//  Created by Ashish Awasthi on 26/12/19.
//  Copyright © 2019 Tanuja Awasthi. All rights reserved.
//

import Foundation
import iOSCoreDataConnect
import CoreData

struct NoticeServiceDao {
    
    static func listOfNotice() ->NoticeInfo? {
          let arrayList = DataManager.convertToJSONArray(moArray: self.managedObjectList( ))
        let dict = ["movie_list" : arrayList, "success" : true]
          guard let data = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) else{
              return nil}
          guard let list = try? JSONDecoder().decode(NoticeInfo.self, from: data)  else{
              return nil}
          return list
      }
      
     static func managedObjectList()->[NSManagedObject] {
          let issuesList = DataManager.fetchObjects(entity: NoticeTable.self, predicate:nil, context: DataManager.mainContext)
          return issuesList
      }
}
