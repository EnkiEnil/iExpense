//
//  Menu.swift
//  iExpense
//
//  Created by Marcus Arkan on 11/14/22.
//

import SwiftUI

struct Menu: View {
    
  
    
    var body: some View {
      
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack {
                    MenuHeader()
                   
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
