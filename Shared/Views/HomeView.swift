//
//  HomeView.swift
//  coinflow (iOS)
//
//  Created by Valentin on 4.12.21.
//

import SwiftUI
import SwiftPieChart

struct HomeView: View {
    
    let types = ["Продукты", "Транспорт", "Еда", "Развлечения", "Прочее"]
    
    var body: some View {
        NavigationView{
            ZStack{
                PieChartView(
                    values: [1300,500],
                    names : types,
                    formatter: {value in String(format: "$%.2f", value)},
                    backgroundColor: Color.black
                    
                ).padding()
            }
            .navigationBarTitle("Header", displayMode: .inline ).background(Color.black)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
