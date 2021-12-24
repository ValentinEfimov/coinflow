//
//  HistoryView.swift
//  coinflow (iOS)
//
//  Created by Valentin on 4.12.21.
//

import SwiftUI
import RealmSwift


struct HistoryView: View {
  
    @ObservedObject var expenses: DBViewModel
    @ObservedObject var expensesLocal: Expenses
    @StateObject var viewmodel = DBViewModel()
    @EnvironmentObject var viewMod : DBViewModel
    var dbItem = DBItem()
    
    var body: some View {
        
        NavigationView {
            List{
                ForEach(expensesLocal.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.type).font(.headline)
                            Text(item.name)
                        }
                        Spacer()
                        Text(String(item.amount)).padding()
                    }
                }.onDelete(perform: { indexSet in
                            viewmodel.deleteData(object: dbItem, at: indexSet)
                    expensesLocal.removeExpenses(as: indexSet)
                    
                }
                )
//                .contextMenu(menuItems: {
//            Button(action: {viewmodel.deleteData(object: dbItem)}, label: {
//                    Text("Delete")
//
//            })
//
//}
//)
            }
        }
    }
    
}
    
struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
