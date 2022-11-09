//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Marcus Arkan on 10/4/22.
//

import Foundation

struct ExpenseItem: Identifiable, Equatable, Codable, Hashable {
    var id = UUID()
    var name: String
    var type: String
    var amount = 0.0
    var date: Date
    var category: String
}
