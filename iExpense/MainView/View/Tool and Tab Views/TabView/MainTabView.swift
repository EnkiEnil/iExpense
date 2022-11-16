

import SwiftUI

struct MainTabView: View {
    
    //MARK: ObservedObjects
    @ObservedObject var expenses: Expenses
    @ObservedObject var bizExpenses: BusinessExpenses
    //MARK: States int
    @State private var selectedItem = 1
    @State private var previousItem = 1
    //MARK: State bool
    @State private var addingCost = false
    
    var body: some View {
        TabView(selection: $selectedItem){
            Text("PlaceHolder").hidden()
                .tabItem {
                    VStack {
                        Text("Add More")
                        Image(systemName: "plus.circle")}
                }
                .tag(2)
            
        }
        
        .onChange(of: selectedItem) {
            if 2 == selectedItem {
                self.addingCost = true
            } else {
                self.previousItem = $0
            }
        } .sheet(isPresented: $addingCost, onDismiss: {
            self.selectedItem = self.previousItem
        }) {
            AddView(expenses: expenses, busExpenses: bizExpenses).presentationDetents([.fraction(0.8),.medium, .large]).presentationDragIndicator(.visible)
        }
        .accentColor(Color.orange)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(expenses: Expenses(), bizExpenses: BusinessExpenses())
    }
}
