//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Marcus Arkan on 10/4/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
}
