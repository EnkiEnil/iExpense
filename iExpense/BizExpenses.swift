////
////  BizExpenses.swift
////  iExpense
////
//
//import SwiftUI
//
//struct BizExpenses: View {
//    @ObservedObject var businessExpenses: Expenses
//    
//    
//    @Environment(\.dismiss) var dismiss
//    
//    @State var name = ""
//    @State var type = "Business"
//    @State var amount = 0.0
//    @State var amountStyle1 = false
//    @State var amountStyle2 = false
//    @State var amountStyle3 = false
//    
//    var amountStyling:Bool {
//        
//        var style = false
//        
//        if amount >= 10.00 && amount < 100 {
//            style = true
//        }
//        else {
//            style = false
//        }
//        return style
//        
//    }
//    
//    var amountStyling_2: Bool {
//        var style = false
//        if amount >= 100.00 && amount < 1000 {
//            style = true
//        }
//        return style
//    }
//    
//    var amountStyling_3: Bool {
//        var style = false
//        if amount >= 1000.00 {
//            style = true
//        }
//        return style
//    }
//    
//    
//    let types = ["Business", "Personal"]
//    
//    var body: some View {
//        NavigationStack {
//            
//            Form {
//                TextField("Name", text: $name)
//                
//                Picker("Type", selection: $type) {
//                    ForEach(types, id:\.self) {
//                        Text($0)
//                    }
//                }.pickerStyle(.segmented)
//                
//                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad).foregroundColor(amountStyling ? .black : amountStyling_2 ? .white : amountStyling_3 ? .white : .white).padding().background(amountStyling ? .green : amountStyling_2 ? .purple : amountStyling_3 ? .red : .gray).cornerRadius(7)
//            }
//            .toolbar {
//                Button{
//                    dismiss()
//                } label: {
//                    Text("Cancel")
//                }
//                
//                Button {
//                    let bizItem = ExpenseItem(name: name, type: type, amount: amount)
//                    businessExpenses.businessItems.append(bizItem)
//                    dismiss()
//                } label: {
//                    Text("Save")
//                }
//            
//            }
//            
//            
//        }.navigationTitle("Add Expense")
//  
//    }
//}
//
//struct BizExpenses_Previews: PreviewProvider {
//    static var previews: some View {
//        BizExpenses(businessExpenses: BusinessExpenses())
//    }
//}
