//
//  MonthOverMonthView.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/11/22.
//

import SwiftUI


struct MonthOverMonthView: View {
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses
    
    var currentMonth: Date {
        let data = expenses.personalExpenses
        var dateSaved = Date()
        for i in data {
            dateSaved = i.date
        }
        return dateSaved
    }
    
    
    var body: some View {
        NavigationStack {
            
        
                VStack {
                    Text("Previous Month: \(previousMonthView(date: currentMonth))")
                    Text("NextMonth: \(nextMonthView(date:currentMonth))")
                    
                }
            }
        }
    }

func lastMonthSpend(num: [Double]) -> Double {
    
    var total = Double()
    
    
    
    return total
}

func nextMonthView(date: Date) -> String {
    

    let personal = Expenses()
    var nextDateStored = NSCalendar.current.date(byAdding: .month, value: 0, to: Date())
    var personalDates: Date {
        var dateFound = date
        for i in personal.personalExpenses {
            dateFound = i.date
        }
        return dateFound
    }
    
   let nextMonth = Calendar.current.date(byAdding: .month, value: 1, to: personalDates)

    let month = nextDateStored?.getNextMonth()
    
    if nextMonth == personalDates {
        nextDateStored = nextMonth
    }
    
    return month?.formatted(date: .complete, time: .omitted) ?? ""
}

func previousMonthView(date: Date) -> String {
    
    let personal = Expenses()
    var previousDateStored = NSCalendar.current.date(byAdding: .month, value: -1, to: Date())
    var personalDates: Date {
        var dateFound = date
        for i in personal.personalExpenses {
            dateFound = i.date
        }
        return dateFound
    }
   
    let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: personalDates)
    
    let month = previousDateStored?.getPreviousMonth()
    
    if previousMonth == personalDates {
        previousDateStored = personalDates
    }
    
    
    return month?.formatted(date: .complete, time: .omitted) ?? ""
}

struct MonthOverMonthView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MonthOverMonthView(expenses: Expenses(), bizExpenses: BusinessExpenses())
        }
    }
}
