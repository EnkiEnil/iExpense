
import SwiftUI

struct ToolBar: View {
    
    
    //MARK: State bool
    @Binding var isShowing: Bool
    
    //MARK: ObservedObjects
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses
    
    var body: some View {
        
        NavigationStack {
 
            //MARK: Add more expenses sheet
            MainTabView(expenses: expenses, bizExpenses: bizExpenses)

        }.toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.spring()) {
                        isShowing.toggle()
                    }
                } label: {

                        Text("Menu")
                        Image(systemName: "list.dash")
                }.foregroundColor(.primary)
            }
        }
     
    }
}

struct ToolBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ToolBar(isShowing: .constant(false), expenses: Expenses(), bizExpenses: BusinessExpenses())
        }
    }
}
