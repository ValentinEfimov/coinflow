//
//  Test.swift
//  coinflow (iOS)
//
//  Created by Valentin on 15.12.21.
//

import Foundation
import RealmSwift

class Test: Object, Identifiable {
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var name = ""
    @objc dynamic var details = ""
    @objc dynamic var amount = ""
    
   
    
}

