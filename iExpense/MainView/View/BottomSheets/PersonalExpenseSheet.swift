import SwiftUI

struct PersonalExpenseSheet: View {
    
    @ObservedObject var expenses: Expenses
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.personalExpenses) {
                        personalItems in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Section {
                                    
                                    Text(personalItems.name).padding(.bottom).font(.title)
                                    Text("Transaction date:").padding(.bottom, 2).font(.headline)
                                    Text("\(personalItems.date)").padding(.trailing).font(.subheadline)
                                    Text("Category: \(personalItems.category)").padding([.trailing, .top]).font(.callout)
                                    
                                }
                            }
                            Spacer()
                            
                            Text(personalItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: personalItems)
                        }
                    }.onDelete(perform: expenses.removePersonal)
                     .onMove(perform: expenses.move)
                }
            }.toolbar {
                EditButton()
            }
        }
    }
    
}

struct PersonalExpenseSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PersonalExpenseSheet(expenses: Expenses())
        }
    }
}
