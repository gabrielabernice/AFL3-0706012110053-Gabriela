//
//  PurchasedScreen.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 02/05/23.
//

import SwiftUI

struct PurchasedScreen: View {
    @Environment(\.dismiss) var dismiss
    var quantity: Int
    var name: String
    var totalprice: Int
    
    var body: some View {
        VStack{
            Spacer()
            
            // to show congratulations text with a yellow star next to it, to show the user that the orders are successfully purchased
            HStack{
                Text("Congratulations!")
                    .font(.largeTitle)
                    .bold()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 28))
            }
            .padding(.bottom, 10)
            
            // to show the quantity, food / bev name, and its total price
            Text("You just bought \(quantity) \(name)\n for Rp. \(totalprice)")
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
            
            Text("Please show this screen to the cashier")
                .font(.headline)
            
            Spacer()
        }
    }
}

struct PurchasedScreen_Previews: PreviewProvider {
    static var previews: some View {
        PurchasedScreen(quantity: 1, name: "Tahu Isi", totalprice: 5000)
    }
}
