//
//  NoticeTable+CoreDataProperties.swift
//  
//
//  Created by Ashish Awasthi on 16/02/20.
//
//

import Foundation
import CoreData
import iOSCoreDataConnect
private let TableName = String(describing: NoticeTable.self)
extension NoticeTable {
   @nonobjc public class func fetchRequest() -> NSFetchRequest<NoticeTable> {
       return NSFetchRequest<NoticeTable>(entityName: TableName)
   }
   
   public class func createManageObject()->NSManagedObject {
       let entity = NSEntityDescription.entity(forEntityName: TableName, in: DataManager.mainContext)!
       let issueInfo = NSManagedObject(entity: entity, insertInto: DataManager.mainContext)
       return issueInfo
   }
    class func saveUserNoticInfo(with list: [NoticeModel]) {
       // Save In core data
       for item in list {
           var userId: String = ""
           if let itemId =  item.idNumber {
               userId = itemId
           }
           let predicate = NSPredicate(format: "\(#keyPath(NoticeTable.idNumber)) == %@", userId)
           let managedObject = DataManager.fetchObject(entity: NoticeTable.self, predicate: predicate, context: DataManager.mainContext)
           if managedObject == nil {
               let noticeTable = NoticeTable.createManageObject()
               noticeTable.setValue(item.idNumber, forKey:"idNumber")
               noticeTable.setValue(item.title, forKey:"title")
               noticeTable.setValue(item.brief, forKey:"brief")
               noticeTable.setValue(item.imageUrl, forKey:"imageUrl")
               DataManager.persist(synchronously: false)
           }
       }
   }
    @NSManaged public var idNumber: String?
    @NSManaged public var title: String?
    @NSManaged public var brief: String?
    @NSManaged public var imageUrl: String?

}
