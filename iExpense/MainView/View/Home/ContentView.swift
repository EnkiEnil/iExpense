import SwiftUI

struct ContentView: View {
    
    //MARK: State bool
    @State private var isShowing: Bool = false
    //MARK: StateObjects
    @StateObject var expenses =  Expenses()
    @StateObject var bizExpenses = BusinessExpenses()
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if isShowing {
                    Menu()
                        
                }
                
                ExpView(expenses: expenses, bizExpenses: bizExpenses)
                    .offset(x: isShowing ? 200: 0, y: isShowing ? 40: 0)
                    .opacity(isShowing ? 0.33 : 1)
                Section {
                    HStack {
                        LastMonthSpending_Personal(expenses: expenses).padding(.trailing, 30).padding()
                        LastMonthSpending_business(businessExpenses: bizExpenses).padding(.trailing, 10).padding(.leading)
                    }.padding(.bottom, 150)
                }
                
                ToolBar(isShowing: $isShowing, expenses: expenses, bizExpenses: bizExpenses)
                    .offset(x: isShowing ? 200: 0, y: isShowing ? 0: 0)
                
               
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContentView(expenses: Expenses(), bizExpenses: BusinessExpenses())
        }
    }
}
