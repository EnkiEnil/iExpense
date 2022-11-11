//
//  MainScreen.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/10/22.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var selectedItem = 1
    @State private var previousItem = 1
    @State private var addingCost = false
    @State private var addMenu = false
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses
    
    var body: some View {
        
        NavigationStack {
            ExpView(expenses: Expenses(), bizExpenses: BusinessExpenses())
            TabView(selection: $selectedItem){
                Text("")    // display the sheet from here
                    .tabItem {
                        VStack {
                            Text("Add More")
                            Image(systemName: "plus.circle")}
                        
                    }
                    .tag(2)
                
           
            }

            .onChange(of: selectedItem) {
                if 2 == selectedItem {
                    self.addingCost = true
                } else {
                    self.previousItem = $0
                }
            } .sheet(isPresented: $addingCost, onDismiss: {
                self.selectedItem = self.previousItem
            }) {
                AddView(expenses: expenses, busExpenses: bizExpenses).presentationDetents([.fraction(0.8),.medium, .large]).presentationDragIndicator(.visible)
            }
            .accentColor(Color.orange)
        


        } .toolbar {
            Button {
                addMenu.toggle()
            } label: {
                Text("Menu")
                Image(systemName: "list.dash")
            }
        }.sheet(isPresented: $addMenu) {
            testSheet.presentationDetents([.fraction(0.7), .large, .medium])
        }
    }
    var testSheet: some View {
        VStack {
            Text("Test Sheet")
        }
    }
}
struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(expenses: Expenses(), bizExpenses: BusinessExpenses())
    }
}
