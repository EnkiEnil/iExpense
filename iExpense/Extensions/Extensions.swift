//
//  Extensions.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/11/22.
//

import Foundation

extension Date {
    
    func getNextMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: 1, to: self)
    }
    
    func getPreviousMonth() -> Date? {
        return Calendar.current.date(byAdding: .month, value: -1, to: self)
    }
    
}
