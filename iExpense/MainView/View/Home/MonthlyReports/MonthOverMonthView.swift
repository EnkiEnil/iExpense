import SwiftUI


struct MonthOverMonthView: View {
    
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses
    
    //MARK: Logic Properties
    
    var previousMonth: String {
        //Getting the current month from array
        var currentMonth: Date {
            let data = expenses.personalExpenses
            var dateSaved = Date()
            for i in data {
                dateSaved = i.date
            }
            return dateSaved
        }
        //From the current month we obtain the previous month
        let previousMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth)
        ////let month = previousMonth?.getPreviousMonth()
        //Formatting date below (havent appended to the output yet)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        guard let lastmonth = previousMonth else { return "No Date" }
        
        let getDate = dateFormatter.string(from: lastmonth )
        
        return getDate
    }
    
    var body: some View {
        NavigationStack {
            
        
                VStack {

                    Text("\(previousMonth)")
         
                }
            }
        }
    }

func lastMonthSpend(num: ExpenseItem) -> Double {

    var total = num.amount
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-yyyy"
    let getDateString = dateFormatter.string(from: num.date)
    let formattedDate = dateFormatter.date(from: getDateString)
    
    

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

func previousMonthView(date: ExpenseItem) -> String {
    
    var previousDateStored = Calendar.current.date(byAdding: .month, value: -1, to: Date())
    var personalDates = date.date
   
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
