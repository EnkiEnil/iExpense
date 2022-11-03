//
//  ContentView.swift
//  iExpense
//
//  Created by Marcus Arkan on 10/3/22.
//

import SwiftUI


struct ExpenseStyle: ViewModifier {
    let expenseItem: ExpenseItem

    func body(content: Content) -> some View {
        switch expenseItem.amount {
        case 0..<100:
            content
                .foregroundColor(.green)
        case 100..<1000:
            content
                .foregroundColor(.orange)
        default:
            content
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}

extension View {
    func expenseStyle(for expenseItem: ExpenseItem) -> some View {
        modifier(ExpenseStyle(expenseItem: expenseItem))
    }
}

struct ContentView: View {
    
    //MARK: StateObjects
    @StateObject var personalExpenses = PersonalExpenses()
    @StateObject var businessExpenses = BusinessExpenses()
    
    //MARK: Sheet Boolean
    @State var addingPersonalCost = false
    @State var addingBizCost = false
    
    
    //MARK: Total
    
    var bizTotal: Double {
        var amount = 0.0
        
        for i in businessExpenses.businessItems {
            amount += i.amount
        }
        
        return amount
    }
    
    var personalTotal: Double {
        var amount = 0.0
        
        for i in personalExpenses.personalItems {
            amount += i.amount
        }
        
        return amount
    }
    
    //MARK: Amounts
    
    var bizAmount:Double {
        
        var amount = 0.0
        
        for i in businessExpenses.businessItems {
            amount = i.amount
        }
        
        return amount
    }
    
    var personalAmount:Double {
        
        var amounts = 0.0
        
        for i in personalExpenses.personalItems {
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
                        ForEach(businessExpenses.businessItems) {
                            bizItems in
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    
                                    Section {
                                        if bizItems.type == "Business" {
                                            
                                            Text(bizItems.name)
                                            Text(bizItems.type)
                                            
                                            
                                        }}
                                }
                                Spacer()
                                
                                Text(bizItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: bizItems)
                                    }

                        }.onDelete(perform: removeBusiness)
                    }
                }
                Divider()
                List {
                    Section("Personal") {
                        ForEach(personalExpenses.personalItems) {
                            personalItems in
                            HStack {
                                
                                VStack(alignment: .leading) {
                                    
                                    Section {
                                        if personalItems.type == "Personal" {
                                            
                                            Text(personalItems.name)
                                            Text(personalItems.type)
                                            
                                            
                                        }else {
                                            Text(personalItems.name)
                                        }
                                        
                                    }
                                }
                                Spacer()

                                Text(personalItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: personalItems)
                                }
                        }.onDelete(perform: removeBusiness)
                    }
                }
                
                Section {
                    VStack {
                        Text("Total").font(.system(size: 36).bold())
                        VStack {
                            Text("Business")
                            Text(bizTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
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
                Button {
                    addingPersonalCost = true
                } label: {
                        Text("Personal")
                        Image(systemName: "plus")
                }
                .sheet(isPresented: $addingPersonalCost) {
                    AddView(personalExpenses: personalExpenses)
                }
            } .toolbar {
                Button {
                    addingBizCost = true
                } label: {
                    Text("Business")
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $addingBizCost) {
                BizExpenses(businessExpenses: businessExpenses)
            }
    }
    
    func removeBusiness(at onset: IndexSet) {
        businessExpenses.businessItems.remove(atOffsets: onset)
    }
    
    func removePersonal(at onset: IndexSet) {
        personalExpenses.personalItems.remove(atOffsets: onset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView()
        }
    }
}
