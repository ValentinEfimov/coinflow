//
//  HistoryView.swift
//  coinflow (iOS)
//
//  Created by Valentin on 4.12.21.
//

import SwiftUI
import Combine


struct HistoryView: View {
  
    @ObservedObject var expenses: Expenses
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack{
                        VStack(alignment: .leading){
                            Text(item.type).font(.headline)
                            Text(item.name)
                        }
                        Spacer()
                        Text("$\(item.amount)").padding()
                    }
                }.onDelete(perform: { indexSet in
                    expenses.removeExpenses(at: indexSet)
               })
            }
            .navigationBarTitle("History", displayMode: .inline)
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
