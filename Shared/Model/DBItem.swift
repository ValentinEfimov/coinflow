//
//  DBItem.swift
//  coinflow (iOS)
//
//  Created by Valentin on 12.12.21.
//

import Foundation
import RealmSwift

class DBItem: Object, Identifiable, ObjectKeyIdentifiable {
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var name = ""
    @objc dynamic var details = ""
    @objc dynamic var amount = ""
    
}

