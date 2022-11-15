import SwiftUI

struct BusinessExpenseSheet: View {
    
    @ObservedObject var bizExpenses: BusinessExpenses
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("Business") {
                    ForEach(bizExpenses.businessExpenses) {
                        businessItems in
                        HStack {
                            
                            VStack(alignment: .leading) {
                                
                                Section {
                                    
                                    Text(businessItems.name).padding(.bottom).font(.title)
                                    Text("Transaction date:").padding(.bottom, 2).font(.headline)
                                    Text("\(businessItems.date)").padding(.trailing).font(.subheadline)
                                    Text(businessItems.category)
                                    
                                }
                            }
                            Spacer()
                            
                            Text(businessItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).expenseStyle(for: businessItems)
                        }
                    }.onDelete(perform: bizExpenses.removeBusiness)
                     .onMove(perform: bizExpenses.move)
                }
            }.toolbar {
                EditButton()
            }
        }
    }
}

struct BusinessExpenseSheet_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BusinessExpenseSheet(bizExpenses: BusinessExpenses())
        }
        
    }
}
