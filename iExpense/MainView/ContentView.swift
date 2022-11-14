//
//  ContentView.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/6/22.
// ExpView(expenses: Expenses(), bizExpenses: BusinessExpenses())

import SwiftUI

struct ContentView: View {
    
    //MARK: State bool

    @State private var isShowing: Bool = false
    
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if isShowing {
                    Menu()
                }
                
                ExpView(expenses: Expenses(), bizExpenses: BusinessExpenses())
                    .offset(x: isShowing ? 0: 0, y: isShowing ? 40: 0)
                    .opacity(isShowing ? 0.33 : 1)
                
                ToolBar(isShowing: $isShowing, expenses: expenses, bizExpenses: bizExpenses)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView(expenses: Expenses(), bizExpenses: BusinessExpenses())
        }
    }
}
