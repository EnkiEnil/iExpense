////
////  Styling.swift
////  iExpense
////
////  Created by Marcus Arkan on 11/6/22.
////
//
//import SwiftUI
//
//
//extension Text {
//
//    func withActionButtonStyling() -> some View {
//        StateObject var bizExpenses = BusinessExpenses()
//        
//        var bizAmount:Double {
//            
//            var amount = 0.0
//            
//            for i in bizExpenses.businessExpenses {
//                amount = i.amount
//            }
//            
//            return amount
//        }
//        
//        var bizAmountStyling:Bool {
//            
//            var bizStyle = false
//            
//            if bizAmount >= 10.00 && bizAmount < 100 {
//                bizStyle = true
//            }
//            else {
//                bizStyle = false
//            }
//            return bizStyle
//            
//        }
//        
//        var bizAmountStyling2: Bool {
//            var bizStyle = false
//            if bizAmount >= 100.00 && bizAmount < 1000 {
//                bizStyle = true
//            }
//            return bizStyle
//        }
//        
//        var bizAmountStyling3: Bool {
//            var bizStyle = false
//            if bizAmount >= 1000.00 {
//                bizStyle = true
//            }
//            return bizStyle
//        }
//        
//        self.padding()
//            .background(bizAmountStyling ? .green : bizAmountStyling2 ? .orange : bizAmountStyling3 ? .red : .black)
//            .foregroundColor(bizAmountStyling ? .white : bizAmountStyling2 ? .white : bizAmountStyling3 ? .white : .white)
//            .cornerRadius(10)
//    }
//}
