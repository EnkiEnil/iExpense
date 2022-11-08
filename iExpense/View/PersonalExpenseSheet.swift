//
//  PersonalExpenseSheet.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/6/22.
//

import SwiftUI

struct PersonalExpenseSheet: View {
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.personalExpenses) {
                        personalItems in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Section {
                                    
                                    Text(personalItems.name)
                                    
                                    
                                }
                            }
                            Spacer()
                            
                            Text(personalItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: personalItems)
                        }
                    }.onDelete(perform: {
                        IndexSet in
                        expenses.removePersonal(at: IndexSet)
                    })
                    .onMove(perform: {
                        IndexSet, newOffset in
                        expenses.move(indices: IndexSet, newOffset: newOffset)
                    })
                }
            }.toolbar {
                EditButton()
            }
        }
    }
    
}

struct PersonalExpenseSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PersonalExpenseSheet(expenses: Expenses())
        }
    }
}
