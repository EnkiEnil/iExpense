//
//  BusinessExpenseSheet.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/6/22.
//

import SwiftUI

struct BusinessExpenseSheet: View {
    
    @ObservedObject var bizExpenses: BusinessExpenses
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("Business") {
                    ForEach(bizExpenses.businessExpenses) {
                        businessItems in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Section {
                                    
                                    Text(businessItems.name)
                            
                                    
                                }
                            }
                            Spacer()
                            
                            Text(businessItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: businessItems)
                        }
                    }.onDelete(perform: {
                        IndexSet in
                        bizExpenses.removeBusiness(at: IndexSet)
                    }).onMove { IndexSet, newOffset in
                        bizExpenses.move(indices: IndexSet, newOffset: newOffset)
                    }
                }
            }.toolbar {
                EditButton()
            }
        }
    }
}

struct BusinessExpenseSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BusinessExpenseSheet(bizExpenses: BusinessExpenses())
        }
        
    }
}
