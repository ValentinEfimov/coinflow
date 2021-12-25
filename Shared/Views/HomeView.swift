//
//  HomeView.swift
//  coinflow (iOS)
//
//  Created by Valentin on 4.12.21.
//
import Foundation
import SwiftUI
import SwiftPieChart

struct HomeView: View {
    
    @ObservedObject var amount: Expenses
    let types = ["Продукты", "Транспорт", "Еда", "Развлечения", "Прочее"]
    
    var body: some View {
        NavigationView{
            ZStack{
                PieChartView(
                    values: amount.AmountOfExpenses,
                    //values: [30,22,9,6,2],
                    names : types,
                    formatter: {value in String(format: "$%.2f", value)},
                    colors: [Color.red, Color.purple, Color.orange, Color.pink, Color.blue],
                    backgroundColor: Color.black

                ).padding()
            }
            .navigationBarTitle("Header", displayMode: .inline ).background(Color.black)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
