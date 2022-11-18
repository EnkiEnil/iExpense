//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Marcus Arkan on 10/3/22.
//

import SwiftUI

@main
struct iExpenseApp: App {
    
    @StateObject var businessExpenses = BusinessExpenses()
    @StateObject var personalExpenses = Expenses()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(expenses: personalExpenses, bizExpenses: businessExpenses)
            }
        }
    }
}
