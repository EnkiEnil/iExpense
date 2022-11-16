
import SwiftUI

struct SideMenuOptions: View {
    let menuList = MenuList(id: UUID())
    var body: some View {
        ForEach(menuList.profileSettings, id: \.self) {
            item in
            Text(item)
        }
    }
}

struct SideMenuOptions_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptions()
    }
}
