//
//  ExpensesManager.swift
//  coinflow (iOS)
//
//  Created by Valentin on 09.12.21.
//

import Foundation
import SwiftUI

class Expenses: ObservableObject {
    @Published var items = [expensesItem]()
    
    func addExpenses(types: [String], amount: String, description:  String ) {
        if let actualAmount = Int(amount) {
            let items1 = expensesItem(name: description, type: String(types[0]), amount: actualAmount)
                items.append(items1)
            }
            print("saving")
    }
    
    func removeExpenses(at indexSet: IndexSet){
        for index in indexSet {
            items.remove(at: index)
        }
    }
}
