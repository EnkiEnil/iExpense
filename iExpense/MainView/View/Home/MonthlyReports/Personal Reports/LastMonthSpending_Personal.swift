//
//  LastMonthSpending_Personal.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/18/22.
//

import SwiftUI

struct LastMonthSpending_Personal: View {
    @ObservedObject var expenses: Expenses
    var body: some View {
        VStack {
            HStack {
                Text("Last Month").font(.headline)
                Text("\(lastMonthExpenses(), format: .currency(code: "USD"))").padding().background(.blue).cornerRadius(10).foregroundColor(.white)
            }
        }
    }
    func lastMonthExpenses() -> Double {
        let calendar = Calendar.current
        let monthAndYear = calendar.dateComponents([.month, .year], from: Date())
        guard let thisMonth = monthAndYear.month,
              let thisYear = monthAndYear.year else { return 0 }
        
        let previousMonth = thisMonth < 2 ? 12 : thisMonth - 1
        
        var total = 0.0
        
        expenses.personalExpenses.forEach { expense in
            let expenseMonthAndYear  = calendar.dateComponents([.month, .year], from: expense.date)
            let expenseMonth = expenseMonthAndYear.month
            let expenseYear = expenseMonthAndYear.year
            if (expenseMonth == previousMonth && thisYear == expenseYear) {
                return total += expense.amount
            }
        }
        
        return total
    }
}


struct LastMonthSpending_Personal_Previews: PreviewProvider {
    static var previews: some View {
        LastMonthSpending_Personal(expenses: Expenses())
    }
}
