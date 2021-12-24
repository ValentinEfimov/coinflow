//
//  DBViewModel.swift
//  coinflow (iOS)
//
//  Created by Valentin on 12.12.21.
//

import Foundation
import RealmSwift
import SwiftUI


class DBViewModel : ObservableObject {
    @Published var name = ""
    @Published var details = ""
    @Published var amount = ""
    @Published var itemsExpense = [expensesItem]()
  
    private var channelsToken: NotificationToken?

    @Published var DBItems = [DBItem]()
    @Published var DBItems2 : [DBItem] 
    
    //Data Updating
    @Published var updateObject : DBItem?
    
    init() {
                let config = Realm.Configuration(
                    // Set the new schema version. This must be greater than the previously used
                    // version (if you've never set a schema version before, the version is 0).
                    schemaVersion: 1,
        
                    // Set the block which will be called automatically when opening a Realm with
                    // a schema version lower than the one set above
                    migrationBlock: { migration, oldSchemaVersion in
                        // We haven’t migrated anything yet, so oldSchemaVersion == 0
                        if (oldSchemaVersion < 1) {
                            // Nothing to do!
                            // Realm will automatically detect new properties and removed properties
                            // And will update the schema on disk automatically
                        }
                    })
        
                // Tell Realm to use this new configuration object for the default Realm
                Realm.Configuration.defaultConfiguration = config
        let dbRef = try! Realm()
            DBItems2 = Array(dbRef.objects(DBItem.self)) // Convert Realm results object to Array
            activateChannelsToken()
           // fetchData()
    }
    private func activateChannelsToken() {
        let dbRef = try! Realm()
        let DBItems2 = dbRef.objects(DBItem.self)
        channelsToken = DBItems2.observe { _ in
            // When there is a change, replace the old channels array with a new one.
            self.DBItems2 = Array(DBItems2)
        }
    }
    
    func addData(type: String, amount: String, description:  String ) {
        let dbItem = DBItem()
        dbItem.amount = amount
        dbItem.name = type
        dbItem.details = description

        let config = Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 1,
        // Set the block which will be called automatically when opening a Realm with
        // a schema version lower than the one set above
        migrationBlock: { migration, oldSchemaVersion in
        // We haven’t migrated anything yet, so oldSchemaVersion == 0
        if (oldSchemaVersion < 1) {
            // Nothing to do!
            // Realm will automatically detect new properties and removed properties
            // And will update the schema on disk automatically
                }
            })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        
        let dbRef = try! Realm()
        try? dbRef.write{

            guard let availableObject = updateObject else{
                dbRef.add(dbItem)
                return
            }
            availableObject.amount = amount
            availableObject.name = type
            availableObject.details = description
        }
    }
    
    func setUpInitialData() {

        guard let updateData = updateObject else {
            return
        }
        
        name = updateData.name
        details = updateData.details
        amount = updateData.amount
    }
    
    func deInitData() {
        details = ""
        amount = ""
        name = ""
    }
    
    func deleteData(object: DBItem, at indexSet: IndexSet){
        
        let dbRef = try! Realm()
        try? dbRef.write{
        let objc = dbRef.objects((DBItem.self))
        let index = indexSet.first!
        dbRef.delete(objc[index])
        }
        
    }
    
}
    
    

