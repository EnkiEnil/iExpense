import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @ObservedObject var busExpenses: BusinessExpenses
    
    enum Field: Hashable {
        case amount
    }
    
    //MARK: Environment Objects
    @Environment(\.dismiss) var dismiss
    
    
    //MARK: Expenses Properties
    
    @State private var name:String = String()
    @State private var type = "Personal"
    @State private var amount:Double = Double()
    @State private var date = Date()
    @State private var selectedCat = "None"
    
    let businessCategoryTypes = ["None", "Office supplies", "Wages", "Taxes"]
    let personalCatorgyTypes = ["None", "Food", "Housing", "Fun"]
    
    let types = ["Personal", "Business"]
    
    //MARK: Amount Styling
    
    @State private var amountStyle1 = false
    @State private var amountStyle2 = false
    @State private var amountStyle3 = false
    
    //MARK: Focus States
    
    @FocusState var isName:Bool
    @FocusState var isPicker:Bool
    @FocusState var isDate: Bool
    @FocusState var isCategory: Bool
    @FocusState var isAmount: Bool
    
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
    
    
    
    
    
    var body: some View {
        NavigationStack {
                VStack {
                    Form {
                        TextField("Name", text: $name).focused($isName)
                        
                        Picker("Type", selection: $type) {
                            ForEach(types, id:\.self) {
                                items in
                                Text(items)
                            }
                        }.pickerStyle(.segmented)
                         
                        
                        DatePicker(selection: $date) {
                            Text("Enter date")
                        }
                        
                        Picker("Select Category", selection: $selectedCat) {
                            
                            if type == "Business" {
                                ForEach(businessCategoryTypes, id:\.self) {
                                    Text($0)
                                }
                            } else {
                                ForEach(personalCatorgyTypes, id:\.self) {
                                    Text($0)
                                }
                            }
                        }
                        
                        
                    }
                    .toolbar {
                        Button{
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        
                        Button {
                            let item = ExpenseItem(name: name, type: typeDepict(typeSelection: types), amount: amount, date: date, category: selectedCat)
                            
                            
                            
                            
                            let nameIsValid = !name.isEmpty
                            var amountIsValid: Bool {
                                if amount == 0.0 {
                                    return true
                                }
                                return Bool()
                            }
                            
                            if nameIsValid && amountIsValid {
                                if type.contains("Personal") {
                                    expenses.personalExpenses.append(item)
                                }
                                else {
                                    busExpenses.businessExpenses.append(item)
                                }
                            } else if nameIsValid {
                                isName = false
                                isAmount = true
                            } else {
                                isName = true
                                isAmount = false
                            }
                            
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                        
                }
                    Section("Enter Amount") {
                        TextField("", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"), prompt: Text(textEditing)).keyboardType(.decimalPad).foregroundColor(amountStyling ? .black : amountStyling_2 ? .white : amountStyling_3 ? .white : .white).padding().background(amountStyling ? .green : amountStyling_2 ? .purple : amountStyling_3 ? .red : .gray).cornerRadius(7).padding().focused($isAmount)
                    }
                    
                }
            
            
            
        }.navigationTitle("Add Expense")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.isName = true
                }
            }
        
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

    
    func personalPicker() -> some View {
        
        let personalPicker = Picker("Category", selection: $selectedCat) {
            ForEach(personalCatorgyTypes, id: \.self) {
                Text($0)
            }
            
        }
        return personalPicker
    }
    
    func businessPicker() -> some View {
        let businessPicker = Picker("Category", selection: $selectedCat) {
            ForEach(businessCategoryTypes, id:\.self) { value in
                Text(value)
            }
            
        }
        return businessPicker
    }
}
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                AddView(expenses: Expenses(), busExpenses: BusinessExpenses())
            }
        }
    }
