import SwiftUI


struct ExpView: View {
    
    //MARK: StateObjects
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses

    
    //MARK: Boolean Values
//    @State private var addingCost = false
    @State private var addingBusinessExpenses = false
    @State private var addingPersonalExpenses = false
    

    //MARK: Amounts for styling

    
    var bizAmount:Double {

        let amount = reduceBusiness()

        return amount
    }
    
    var personalAmount:Double {
        
        let amount = reducePersonal()
        
        return amount
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
        
        TabView {
        
        VStack {
            Section {
                VStack {
                    Text("Total").font(.system(size: 36).bold()).foregroundColor(.secondary)
                    HStack {
                        Spacer()
                        VStack {
                            Text("Personal").foregroundColor(.primary)
                            Button {
                                addingPersonalExpenses.toggle()
                            } label: {
                                    Text(reducePersonal(), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .padding()
                                        .background(amountStyling ? .green : amountStyling_2 ? .orange : amountStyling_3 ? .purple : .black)
                                        .foregroundColor(amountStyling ? .white : amountStyling_2 ? .white : amountStyling_3 ? .white : .white)
                                        .cornerRadius(10)

                                }.sheet(isPresented: $addingPersonalExpenses) {
                                    PersonalExpenseSheet(expenses: expenses).presentationDetents([.fraction(0.8),.medium, .large]).presentationDragIndicator(.visible)
                            }
          
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text("Business").foregroundColor(.primary)
                            
                            Button {
                                addingBusinessExpenses.toggle()
                            } label: {
                                    Text(reduceBusiness(), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                        .padding()
                                        .background(bizAmountStyling ? .green : bizAmountStyling2 ? .orange : bizAmountStyling3 ? .purple : .black)
                                        .foregroundColor(bizAmountStyling ? .white : bizAmountStyling2 ? .white : bizAmountStyling3 ? .white : .white)
                                        .cornerRadius(10)
                                        }

                                        .sheet(isPresented: $addingBusinessExpenses) {
                                            BusinessExpenseSheet(bizExpenses: bizExpenses).presentationDetents([.fraction(0.8),.medium, .large]).presentationDragIndicator(.visible)
                                }
                        }
                        Spacer()
                    }
                }
            }
        }.frame(width: 500, height: 500)
        
    }.navigationTitle("iExpense")
        
    }
    
    func reducePersonal() -> Double {
        var storedValues = 0.0

        for value in expenses.personalExpenses {
            storedValues += value.amount
        }

        return storedValues
    }
    
    func reduceBusiness() -> Double {
        var storedValue = 0.0
        
        for value in bizExpenses.businessExpenses {
            storedValue += value.amount
        }
        
        return storedValue
    }
}

struct ExpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ExpView(expenses: Expenses(), bizExpenses: BusinessExpenses())
        }
    }
}
