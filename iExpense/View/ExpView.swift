//
//  ExpView.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/3/22.
//

import SwiftUI


struct ExpView: View {
    //MARK: StateObjects
    @StateObject var expenses = Expenses()
    @StateObject var bizExpenses = BusinessExpenses()

    //MARK: Total
    
    @State var addingCost = false
    
    var businessTotal:Double {
        var amount = 0.0
        
        for i in bizExpenses.businessExpenses {
            amount += i.amount
        }
        return amount
    }
    
    var personalTotal: Double {
        var amount = 0.0
        
        for i in expenses.personalExpenses {
            amount += i.amount
        }
        
        return amount
    }
    
    //MARK: Amounts
    
    var bizAmount:Double {
        
        var amount = 0.0
        
        for i in bizExpenses.businessExpenses {
            amount = i.amount
        }
        
        return amount
    }
    
    var personalAmount:Double {
        
        var amounts = 0.0
        
        for i in expenses.personalExpenses {
            amounts = i.amount
        }
        
        return amounts
    }
    
    //MARK: Boolean for Biz styling
    
    var bizAmountStyling:Bool {
        
        var bizStyle = false
        
        if bizAmount >= 10.00 && bizAmount < 100 {
            bizStyle = true
        }
        else {
            bizStyle = false
        }
        return bizStyle
        
    }
    
    var bizAmountStyling2: Bool {
        var bizStyle = false
        if bizAmount >= 100.00 && bizAmount < 1000 {
            bizStyle = true
        }
        return bizStyle
    }
    
    var bizAmountStyling3: Bool {
        var bizStyle = false
        if bizAmount >= 1000.00 {
            bizStyle = true
        }
        return bizStyle
    }
    
    //MARK: Boolean for Personal styling
    
    var amountStyling:Bool {
        
        var style = false
        
        if personalAmount >= 10.00 && personalAmount < 100 {
            style = true
        }
        else {
            style = false
        }
        return style
        
    }
    var amountStyling_2: Bool {
        var style = false
        if personalAmount >= 100.00 && personalAmount < 1000 {
            style = true
        }
        return style
    }
    
    var amountStyling_3: Bool {
        var style = false
        if personalAmount >= 1000.00 {
            style = true
        }
        return style
    }
    
    
    var body: some View {
        
        NavigationStack {
        
        VStack {
            
            List {
                Section("Business") {
                    ForEach(bizExpenses.businessExpenses) {
                        businessItems in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Section {

                                    Text(businessItems.name)
                                    Text(businessItems.type)
                                    
                                }
                            }
                            Spacer()
                            
                            Text(businessItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: businessItems)
                        }
                    }.onDelete(perform: removeBusiness)
                }
            }
            
            
            Divider()
            List {
                Section("Personal") {
                    ForEach(expenses.personalExpenses) {
                        personalItems in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Section {
                        
                                    Text(personalItems.name)
                                    Text(personalItems.type)
                                    
                                }
                            }
                            Spacer()
                            
                            Text(personalItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: personalItems)
                        }
                    }.onDelete(perform: removePersonal)
                }
            }
            
            Section {
                VStack {
                    Text("Total").font(.system(size: 36).bold())
                    VStack {
                        Text("Business")
                        Text(businessTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .padding()
                            .background(bizAmountStyling ? .green : bizAmountStyling2 ? .orange : bizAmountStyling3 ? .red : .black)
                            .foregroundColor(bizAmountStyling ? .white : bizAmountStyling2 ? .white : bizAmountStyling3 ? .white : .white)
                            .cornerRadius(10)
                        
                        Text("Personal")
                        Text(personalTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .padding()
                            .background(amountStyling ? .green : amountStyling_2 ? .orange : amountStyling_3 ? .red : .black)
                            .foregroundColor(amountStyling ? .white : amountStyling_2 ? .white : amountStyling_3 ? .white : .white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        
    }.navigationTitle("iExpense")
        .toolbar {
            EditButton()
            Button {
                addingCost = true
            } label: {
                Text("Add")
                Image(systemName: "plus")
            }
            .sheet(isPresented: $addingCost) {
                AddView(expenses: expenses, bizExpenses: bizExpenses)
            }
        }
    
}

func removeBusiness(at onset: IndexSet) {

    bizExpenses.businessExpenses.remove(atOffsets: onset)

}

func removePersonal(at onset: IndexSet) {
    expenses.personalExpenses.remove(atOffsets: onset)
}
}

struct ExpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExpView()
        }
    }
}
