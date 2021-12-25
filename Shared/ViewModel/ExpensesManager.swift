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
    @Published var AmountOfExpenses = [Double](repeating: 0.001, count: 5)
    
    func addExpenses(type: String, amount: String, description:  String ) {
        if let actualAmount = Int(amount) {
            let _items = expensesItem(name: description, type: String(type), amount: actualAmount)
                items.append(_items)
            var num: String
            num = type
            print(num)
            switch num {
            case "Продукты":
                print("here")
               
                AmountOfExpenses[0] += (amount as NSString).doubleValue
               // print(AmountOfExpenses[0])
            case "Транспорт":
                AmountOfExpenses[1] += (amount as NSString).doubleValue
            case "Еда":
                AmountOfExpenses[2] += (amount as NSString).doubleValue
            case "Развлечения":
                AmountOfExpenses[3] += (amount as NSString).doubleValue
            case "Прочее":
                AmountOfExpenses[4] += (amount as NSString).doubleValue
            default:
                print("error")
                print(AmountOfExpenses)
            }
            }
            print("saving")
    }
    
    func removeExpenses(as offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
//    func getAmoungArray()-> Array<Double> {
//        var num: String
//        
//        for index in 0...items.count-1 {
//            num = items[index].type
//            switch num {
//            case "Продукты":
//                AmountOfExpenses[0] += Double(items[index].amount)
//            case "Транспорт":
//                AmountOfExpenses[1] += Double(items[index].amount)
//            case "Еда":
//                AmountOfExpenses[2] += Double(items[index].amount)
//            case "Развлечения":
//                AmountOfExpenses[3] += Double(items[index].amount)
//            case "Прочее":
//                AmountOfExpenses[4] += Double(items[index].amount)
//            default:
//                print("error")
//            }
//            
//            
//            
//        }
//        return AmountOfExpenses
//    }
    
    
    }

