//
//  Expenses.swift
//  iExpense
//
//  Created by Marcus Arkan on 10/4/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var personalExpenses = [ExpenseItem]() {
        didSet {
            if let encoder = try? JSONEncoder().encode(personalExpenses) {
                UserDefaults.standard.set(encoder, forKey: "PersonalItems")
            }
        }
    }
    init() {
        if let userData = UserDefaults.standard.data(forKey: "PersonalItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: userData) {
                personalExpenses = decodedItems
                return
            }
                
        }
        personalExpenses = []
    }
}

class BusinessExpenses: ObservableObject {
    @Published var businessExpenses = [ExpenseItem]() {
        didSet {
            if let encoder = try? JSONEncoder().encode(businessExpenses) {
                UserDefaults.standard.set(encoder, forKey: "BusinessItems")
            }
        }
    }
    init() {
        if let userData = UserDefaults.standard.data(forKey: "BusinessItems") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: userData) {
                businessExpenses = decodedItems
                return
            }

        }
        businessExpenses = []
    }
}
