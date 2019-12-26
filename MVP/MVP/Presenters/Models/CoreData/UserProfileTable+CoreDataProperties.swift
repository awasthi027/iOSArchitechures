//
//  UserProfileTable+CoreDataProperties.swift
//  
//
//  Created by Ashish Awasthi on 26/12/19.
//
//

import Foundation
import CoreData
import iOSCoreDataConnect
private let TableName = String(describing: UserProfileTable.self)

extension UserProfileTable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserProfileTable> {
        return NSFetchRequest<UserProfileTable>(entityName: TableName)
    }
    
    public class func createManageObject()->NSManagedObject {
        let entity = NSEntityDescription.entity(forEntityName: TableName, in: DataManager.mainContext)!
        let issueInfo = NSManagedObject(entity: entity, insertInto: DataManager.mainContext)
        return issueInfo
    }
     class func saveUserProfileInfo(with list: [UserProfileInfo]) {
        // Save In core data
        for item in list {
            var userId: Int16 = 0
            if let itemId =  item.userId {
                userId = itemId
            }
            let predicate = NSPredicate(format: "\(#keyPath(UserProfileTable.id)) == %d", userId)
            let managedObject = DataManager.fetchObject(entity: UserProfileTable.self, predicate: predicate, context: DataManager.mainContext)
            if managedObject == nil {
                let userTable = UserProfileTable.createManageObject()
                userTable.setValue(item.userId, forKey:"id")
                userTable.setValue(item.name, forKey:"name")
                userTable.setValue(item.skills, forKey:"skills")
                userTable.setValue(item.imageUrl, forKey:"image")
                DataManager.persist(synchronously: false)
            }
        }
    }
    @NSManaged public var id: Int16
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var skills: String?

}
