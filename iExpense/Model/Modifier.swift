//
//  Modifier.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/3/22.
//

import Foundation
import SwiftUI


struct ExpenseStyle: ViewModifier {
    
    
    let expenseItem: ExpenseItem
    
    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<100:
            content
                .foregroundColor(.green)
        case 100..<1000:
            content
                .foregroundColor(.orange)
        default:
            content
                .font(.headline)
                .foregroundColor(.purple)
        }
    }
}

extension View {
    func expenseStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseStyle(expenseItem: expenseItem))
    }
}
