//
//  StatusView.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/14/22.
//

import SwiftUI

struct StatusView: View {
    let menuList = MenuList(id: UUID())
    var body: some View {
        Text(menuList.userName).font(.caption)
            .padding(.bottom, 1)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView()
    }
}
