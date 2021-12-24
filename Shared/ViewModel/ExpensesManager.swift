//
//  ExpensesManager.swift
//  coinflow (iOS)
//
//  Created by Valentin on 09.12.21.
//

import Foundation
import SwiftUI
import RealmSwift

class Expenses: ObservableObject {
    
    @Published var items = [expensesItem]()
    
    func addExpenses(type: String, amount: String, description:  String ) {
        if let actualAmount = Int(amount) {
            let _items = expensesItem(name: description, type: String(type), amount: actualAmount)
                items.append(_items)
            }
            print("saving")
    }
    
    func removeExpenses(as offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
        
    }

