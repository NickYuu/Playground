//: Playground - noun: a place where people can play

import UIKit
import CloudKit


// 新增
func insert() {
    
    let publicDB = CKContainer.default().publicCloudDatabase
    
    let record = CKRecord(recordType: "Note")
    
    record["note"] = "WWDC16" as CKRecordValue?
    
    publicDB.save(record) { (record, error) in
        if error == nil {
            print("儲存成功")
        } else {
            print("儲存失敗: \(error)")
        }
    }
}


// 查詢
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
        
        // TODO
        
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

// 刪除
func delete() {
    let db = CKContainer.default().publicCloudDatabase
    let predicate = NSPredicate(format: "note = %@", "你好")
    let query = CKQuery(recordType: "Note", predicate: predicate)
    
    let operation = CKQueryOperation(query: query)
    
    operation.recordFetchedBlock = { (record : CKRecord?) in
        guard let record = record else {
            return
        }
        
        db.delete(withRecordID: record.recordID, completionHandler: { (recordID, error) in
            if error == nil {
                print("刪除成功")
            } else {
                print("刪除失敗: \(error)")
            }
        })
    }
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

// 修改
func modify() {
    let db = CKContainer.default().publicCloudDatabase
    let predicate = NSPredicate(format: "note = %@", "WWDC16")
    let query = CKQuery(recordType: "Note", predicate: predicate)
    
    
    let operation = CKQueryOperation(query: query)
    
    operation.recordFetchedBlock = { (record : CKRecord?) in
        guard let record = record else {
            return
        }
        
        record["note"] = "WWDC17" as CKRecordValue?
        let array = [record]
        let modifyOperation = CKModifyRecordsOperation(recordsToSave: array, recordIDsToDelete: nil)
        
        modifyOperation.perRecordCompletionBlock = { (record, error) in
            if error == nil {
                print("資料修改完成")
            } else {
                print("資料修改失敗: \(error)")
            }
        }
        
        db.add(modifyOperation)
    }
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