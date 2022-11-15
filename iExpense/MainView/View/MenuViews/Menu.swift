
import SwiftUI

struct Menu: View {
    
  
    
    var body: some View {
      
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack {
                    MenuHeader()
                        .frame(width: 400, height: 500)
                       
                    Spacer()
                   
                }
            }
        }
    }


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Menu()
        }
    }
}
