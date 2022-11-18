//import SwiftUI
/*
 
 Trial and errors on getting the previous months total spending
Keeping it for referencing encase I need some of the logic in the future.
 
 
*/


//struct Personal_Monthly_Report: View {
////     var amount: Double {
////         let today = Date.now
////         let getPreviousMonth = today.getPreviousMonth() ?? Date.now
////
////         let amounts = totalSpent(from: today, past: getPreviousMonth)
////
////         return amounts
////    }
//
//    @ObservedObject var expenses: Expenses
//
//
//    var body: some View {
//        NavigationStack {
//
//
//            VStack {
//                HStack {
//                    Text("Last Month: ")
//                    Text("\(lastMonthExpenses(), format: .currency(code: "USD"))")
//                }
//            }
//
//        }
//    }
//    func lastMonthExpenses() -> Double {
//        let calendar = Calendar.current
//        let today = Date.now
//        let monthAndYear = calendar.dateComponents([.month, .year], from: Date())
//        guard let thisMonth = monthAndYear.month,
//              let thisYear = monthAndYear.year else { return 0 }
//
//        let previousMonth = thisMonth < 2 ? 12 : thisMonth - 1
//
//        var total = 0.0
//
//        expenses.personalExpenses.forEach { expense in
//            let expenseMonthAndYear  = calendar.dateComponents([.month, .year], from: expense.date)
//            let expenseMonth = expenseMonthAndYear.month
//            let expenseYear = expenseMonthAndYear.year
//            if (expenseMonth == previousMonth && thisYear == expenseYear) {
//                return total += expense.amount
//            }
//        }
//
////        let total = expenses.personalExpenses.reduce(0) { partialResult, expense in
////            let expenseMonth  = calendar.component(.month, from: expense.date)
////            if (expenseMonth == previousMonth) {
////                return partialResult + expense.amount
////            }
////            return partialResult
////        }
//
//        print("Total: ", total)
//
//        return total
//    }
//    func totalSpent(pastDate: Date, presentDay: Date) -> Double {
//        //checking duration between days
//        // let duration = presentDay.days(from: pastDate)
//        let currentDays = differenceInDays()
//        let duration = daysSinceLastMonth(pastDate: pastDate, presentDay: presentDay)
//        let variance = duration - currentDays
//        //getting the previous month starting from the first of the month
//        let today = Date.now
//        let getPreviousMonth = today.getPreviousMonth() ?? Date.now
//        let startOfMonth = getPreviousMonth.startOfMonth()
//
//        //get the end of the month of last month
//
//        // let endOfLastMonth = startOfMonth.endOfMonth()
//
//        // let daysBetweenDays = Date.intervalDistance(lhs: endOfLastMonth, rhs: startOfMonth)
//
//        //storing and obtaining from array
//
//        var dates:[Date] = [Date]()
//        var personalExp:[Double] = [Double]()
//        let personal = expenses.personalExpenses
//        print("PPPERr: ", personal)
//
//        var output = Double()
//        let data = personal.map { dataArray in
//            dates.append(dataArray.date)
//            personalExp.append(dataArray.amount)
//        }
//
////        for dateSequence in dates {
////            let sequenceDates = dateSequence.getPreviousMonth()?.startOfMonth()
////            for amountSequence in personalExp {
////               let datedAmounts = amountSequence[sequenceDates]
////            }
////        }
//
//
//        return output
//    }
//
//
//
//
//
//    func endOfLastMonth() -> Date {
//        let today = Date.now
//        let getPreviousMonth = today.getPreviousMonth() ?? Date.now
//        let startOfMonth = getPreviousMonth.startOfMonth()
//
//        //get the end of the month of last month
//
//        let endOfMonth = startOfMonth.endOfMonth()
//
//        return endOfMonth
//    }
//
//
//    func differenceInDays() -> Int {
//        let startMonth = Date().startOfMonth()
//        let nowDate = Date.now
//        let startMonthDays = nowDate.days(from: startMonth)
//
//        return startMonthDays
//    }
//
//    func futureDay() -> Date {
//        let today = Date.now
//        let getNextMonth = today.getNextMonth() ?? Date.now
//        let startMonth = getNextMonth.startOfMonth()
//
//        return startMonth
//
//    }
//
//    func daysSinceLastMonth(pastDate: Date, presentDay: Date) -> Int {
//        let days = presentDay.days(from: pastDate)
//        return days
//    }
//
//    func beginningOfMonth() -> Date {
//        let today = Date.now
//        let getPreviousMonth = today.getPreviousMonth() ?? Date.now
//        let startOfMonth = getPreviousMonth.startOfMonth()
//
//        return startOfMonth
//    }
//}
//
//struct Personal_Monthly_Report_Previews: PreviewProvider {
//    static var previews: some View {
//        Personal_Monthly_Report(expenses: Expenses())
//    }
//}
