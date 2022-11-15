//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Marcus Arkan on 10/4/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    var name: String
    var type: String
    var amount = 0.0
    var date: Date
    var category: String
}

struct MenuList: Identifiable {
    var id = UUID()
    var userName: String = "@MarkyMark"
    let profileSettings:[String] = ["Profile", "Settings"]
}

struct MyItem: Identifiable {
    var name: String
    let id = UUID()
}
