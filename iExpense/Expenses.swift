//
//  Expenses.swift
//  iExpense
//
//  Created by Marcus Arkan on 10/4/22.
//

import Foundation

class PersonalExpenses: ObservableObject {
    @Published var personalItems = [ExpenseItem]() {
        didSet {
            if let encoder = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoder, forKey: "Items")
            }
        }
    }
    init() {
        if let userData = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: userData) {
                personalItems = decodedItems
                return
            }
                
        }
        personalItems = []
    }
}

class BusinessExpenses: ObservableObject {
    @Published var businessItems = [ExpenseItem]() {
        didSet {
            if let encoder = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoder, forKey: "Items")
            }
        }
    }
    init() {
        if let userData = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: userData) {
                businessItems = decodedItems
                return
            }
                
        }
        businessItems = []
    }
}
