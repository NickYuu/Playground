//: Playground - noun: a place where people can play

import UIKit
import CloudKit

func query() {
    let db = CKContainer.default().publicCloudDatabase
    let predicate = NSPredicate(value: true)
    let sort = NSSortDescriptor(key: "creationDate", ascending: true)
    let query = CKQuery(recordType: "Note", predicate: predicate)
    query.sortDescriptors = [sort]
    let operation = CKQueryOperation(query: query)
    
    // 有幾筆資料就Call幾次
    operation.recordFetchedBlock = { (record : CKRecord?) in
        guard record != nil else {
            return
        }
        
        // TODO:-
        
    }
    
    // 查詢結束
    operation.queryCompletionBlock = { (cursor, error) in
        guard error == nil else {
            print(error?.localizedDescription ?? "Error")
            return
        }
        // 結束後要做什麼事情
    }
    
    // 執行
    db.add(operation)
}


