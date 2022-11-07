//
//  BusinessExpenseSheet.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/6/22.
//

import SwiftUI

struct BusinessExpenseSheet: View {
    
    @StateObject var bizExpenses = BusinessExpenses()
    
    var body: some View {
        
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
                }.onDelete(perform: removeBusiness)
            }
        }
    }
    func removeBusiness(at onset: IndexSet) {
        bizExpenses.businessExpenses.remove(atOffsets: onset)
    }
}

struct BusinessExpenseSheet_Previews: PreviewProvider {
    static var previews: some View {
        BusinessExpenseSheet()
    }
}
