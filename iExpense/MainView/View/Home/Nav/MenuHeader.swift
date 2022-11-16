import SwiftUI

struct MenuHeader: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Image("Avatar")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
                StatusView()
            
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        Text("Status:")
                        Text("Online").foregroundColor(.green).font(.callout).bold()
                        
                        Spacer()
                    }
                }.padding(.bottom, 12)
                
                SideMenuOptions()
            }.padding(.bottom, 12)
            
            Spacer()
            
        }.padding(.leading, 30)
            .foregroundColor(.white)
    }
}

struct MenuHeader_Previews: PreviewProvider {
    static var previews: some View {
        MenuHeader()
    }
}



