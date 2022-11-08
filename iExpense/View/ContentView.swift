//
//  ContentView.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        NavigationStack {
            NavigationStack {
                
                ExpView(expenses: Expenses(), bizExpenses: BusinessExpenses())
             
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
