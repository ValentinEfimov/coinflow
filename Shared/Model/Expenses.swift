//
//  Expenses.swift
//  coinflow (iOS)
//
//  Created by Valentin on 09.12.21.
//

import Foundation
import SwiftUI

struct expensesItem : Identifiable {
    var id = UUID()
    var name : String
    var type : String
    var amount : Int
}
