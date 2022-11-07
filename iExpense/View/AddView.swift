//
//  AddView.swift
//  iExpense
//


import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @ObservedObject var busExpenses: BusinessExpenses
    
    enum Field: Hashable {
        case amount
    }
    
    @FocusState private var enterAmount: Field?
    
    //MARK: Environment Objects
  //  @EnvironmentObject var busExpenses: BusinessExpenses
    @Environment(\.dismiss) var dismiss
    
    
    //MARK: Expenses Properties
    
    @State var name = ""
    @State var type = "Personal"
    @State var amount = 0.0
    
    
    //MARK: Amount Styling
    
    @State var amountStyle1 = false
    @State var amountStyle2 = false
    @State var amountStyle3 = false
    
    var amountStyling:Bool {
        
        var style = false
        
        if amount >= 10.00 && amount < 100 {
            style = true
        }
        else {
            style = false
        }
        return style
        
    }
    
    var amountStyling_2: Bool {
        var style = false
        if amount >= 100.00 && amount < 1000 {
            style = true
        }
        return style
    }
    
    var amountStyling_3: Bool {
        var style = false
        if amount >= 1000.00 {
            style = true
        }
        return style
    }
    
    
    @State var isEditingTrue = false
    @State var textEditing = "Enter Amount"
    
    let types = ["Personal", "Business"]
    
    
    
    var body: some View {
        NavigationStack {
            
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id:\.self) {
                        items in
                        Text(items)
                    }
                }.pickerStyle(.segmented)
                
                
                TextField("", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"), prompt: Text(textEditing)).keyboardType(.decimalPad).foregroundColor(amountStyling ? .black : amountStyling_2 ? .white : amountStyling_3 ? .white : .white).padding().background(amountStyling ? .green : amountStyling_2 ? .purple : amountStyling_3 ? .red : .gray).cornerRadius(7).focused($enterAmount, equals: .amount)
            }
            .toolbar {
                Button{
                    dismiss()
                } label: {
                    Text("Cancel")
                }
                
                Button {
                    let item = ExpenseItem(name: name, type: typeDepict(typeSelection: types), amount: amount)
                    
                    
//                    if amount.isZero {
//                        enterAmount = .amount
//                    }else {
//                        isEdit(isEditing: isEditingTrue)
//                    }
                    
                    if type.contains("Personal") {
                        expenses.personalExpenses.append(item)
                    }
                    else {
                        busExpenses.businessExpenses.append(item)
                        //bizExpenses.businessExpenses.append(item)
                    }
                    
                    dismiss()
                } label: {
                    Text("Save")
                }
                
            }
            
            
        }.navigationTitle("Add Expense")
        
    }
    
    func typeDepict(typeSelection: [String]) -> String {
        var selected = ""
        
        if type == "Personal" {
            selected = typeSelection[0]
            
        } else {
            selected = typeSelection[1]
        }
        
        return selected
    }
    
//    @discardableResult func isEdit(isEditing: Bool) -> some View {
//
//
//        let textValue = TextField("Amount", text: $textEditing) { item in
//            if item == isEditing {
//                textEditing = ""
//            }
//
//        }
//
//        return textValue
//
//    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddView(expenses: Expenses(), busExpenses: BusinessExpenses())
        }
    }
}
