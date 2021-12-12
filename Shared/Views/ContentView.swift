//
//  ContentView.swift
//  Shared
//
//  Created by Valentin on 2.12.21.
//

import SwiftUI
import SwiftPieChart
import RealmSwift
import Foundation

struct ContentView: View {
    
    @State var selectedIndex = 0
    @State var shouldShowModals = false
    @State var showCategorySheet = false
    @State  var description = ""
    @State  var type = "Еда"
    @State  var amount = ""
    
    let types = ["Продукты", "Транспорт", "Еда", "Развлечения", "Прочее"]
    
    @ObservedObject var expenses = Expenses()
    
    let tabBarImageNames = ["house","list.dash","plus.app.fill","gear","person"]
    
    var body: some View {
        
        VStack {
            ZStack{
                Spacer().fullScreenCover(isPresented: $shouldShowModals, content: {
                    HStack{
                        Button(action: {
                            shouldShowModals.toggle()
                            self.description = ""
                            self.amount = ""
                        }, label: {
                            Text("Back").frame(width: 79, height:20, alignment: .center).font(.largeTitle).padding()
                            Spacer()
                        })
                        Button(action:
                                {
                                    expenses.addExpenses(types: types, amount: amount, description: description)
                                    shouldShowModals.toggle()
                                    self.description = ""
                                    self.amount = ""
                                }, label: {
                            Text("Save").font(.largeTitle).padding()
                        })
                    }
                    
                    Form {
                        TextField("Стоимость", text: $amount).keyboardType(.numberPad)
                        TextField("Заметки", text: $description)
                        
                        Button(action: {
                            self.showCategorySheet = true
                        }, label: {
                            HStack{
                                Text("Категория")
                                Spacer()
                                Text("\(self.type)")
                            }
                        }).sheet(isPresented: $showCategorySheet, content: {
                            HStack{
                                Picker("Тип", selection: $type) {
                                    ForEach(self.types, id: \.self) {
                                        Text($0)
                                    }
                                }
                                Spacer()
                                Button(action: {
                                    showCategorySheet.toggle()
                                }) {
                                    Text("Применить")
                                }
                            }
                        }
                        )
                    }
                })
                switch selectedIndex {
                case 0:
                    HomeView()
                case 1:
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
                            }
                            .onDelete(perform: { indexSet in
                                expenses.removeExpenses(at: indexSet)
                            })
                        }
                        .navigationBarTitle("History", displayMode: .inline)
                    }
                default:
                    NavigationView {
                        Text("Remainnig tabs")
                    }
                }
            }
            Divider().padding(.bottom, 8)
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        if num == 2 {
                            shouldShowModals.toggle()
                            return
                        }
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            Image(systemName: tabBarImageNames[num]).font(.system(size: 44, weight: .bold)).foregroundColor(.red)
                            
                        } else {
                            Image(systemName: tabBarImageNames[num]).font(.system(size: 24, weight: .bold)).foregroundColor(selectedIndex == num ? Color(.black) : .gray)
                        }
                        Spacer()
                    })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
