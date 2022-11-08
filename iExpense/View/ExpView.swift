//
//  ExpView.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/3/22.
//

import SwiftUI


struct ExpView: View {
    //MARK: StateObjects
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses

    
    //MARK: Boolean Values
    @State private var addingCost = false
    @State private var addingBusinessExpenses = false
    @State private var addingPersonalExpenses = false
    
    //MARK: Saved Total Display
    
    @State private var savedBusTotal = 0.0
    @State private var savedPersonalTotal = 0.0
    

    //MARK: Amounts for styling
    
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
            Section {
                VStack {
                    Text("Total").font(.system(size: 36).bold()).foregroundColor(.secondary)
                    HStack {
                        Spacer()
                        VStack {
                            Text("Business").foregroundColor(.primary)
                            
                            Button {
                                addingBusinessExpenses.toggle()
                            } label: {
                                ForEach(bizExpenses.businessExpenses) {
                                    Text($0.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .padding()
                                        .background(bizAmountStyling ? .green : bizAmountStyling2 ? .orange : bizAmountStyling3 ? .purple : .black)
                                        .foregroundColor(bizAmountStyling ? .white : bizAmountStyling2 ? .white : bizAmountStyling3 ? .white : .white)
                                        .cornerRadius(10).onReceive(bizExpenses.$businessExpenses) {
                                            $0.forEach { item in
                                                savedBusTotal = item.amount
                                            }
                                        }
                                }.onChange(of: bizExpenses.businessExpenses, perform: {
                                    $0.forEach { savedBusTotal = $0.amount
                                    }
                                })
                                .sheet(isPresented: $addingBusinessExpenses) {
                                    BusinessExpenseSheet(bizExpenses: bizExpenses).presentationDetents([.medium, .large]).presentationDragIndicator(.visible)
                                }
                            }
                               

                          
                        }
                        Spacer()
                        VStack {
                            Text("Personal").foregroundColor(.primary)
                            Button {
                                addingPersonalExpenses.toggle()
                            } label: {
                                
                                ForEach(expenses.personalExpenses) {
                                    Text($0.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .padding()
                                        .background(amountStyling ? .green : amountStyling_2 ? .orange : amountStyling_3 ? .purple : .black)
                                        .foregroundColor(amountStyling ? .white : amountStyling_2 ? .white : amountStyling_3 ? .white : .white)
                                        .cornerRadius(10).onReceive(expenses.$personalExpenses) {
                                            $0.forEach { item in
                                                savedPersonalTotal = item.amount
                                            }
                                        }.onChange(of: expenses.personalExpenses) {
                                            $0.forEach { savedPersonalTotal = $0.amount
                                            }
                                        }
                                }.sheet(isPresented: $addingPersonalExpenses) {
                                    PersonalExpenseSheet(expenses: expenses).presentationDetents([.medium, .large]).presentationDragIndicator(.visible)
                                }
                            }
          
                        }
                        Spacer()
                    }
                }
            }
        }
        
    }.navigationTitle("iExpense")
        .toolbar {
            Button {
                addingCost = true
            } label: {
                Text("Add")
                Image(systemName: "plus")
            }
            .sheet(isPresented: $addingCost) {
                AddView(expenses: expenses, busExpenses: bizExpenses).presentationDetents([.medium, .large]).presentationDragIndicator(.visible)
            }
        }
    
    }
}

struct ExpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExpView(expenses: Expenses(), bizExpenses: BusinessExpenses())
        }
    }
}
