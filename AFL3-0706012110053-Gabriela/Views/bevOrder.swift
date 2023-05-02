//
//  BevOrder.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 02/05/23.
//

import SwiftUI

struct BevOrder: View {
    @State var quantity: String = ""
    @EnvironmentObject var modelData: ModelData
    var bev: Bev
    
    @State var check: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("How many \(bev.bevName) do you want to buy?")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
            // to allow the user to input the amount of bevs they want to buy
            TextField("Enter quantity", text: $quantity)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .font(.system(size: 16, weight: .bold))
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black.opacity(0.3), lineWidth: 2)
                )
                .keyboardType(.numberPad)
            
            // if the input does not meet the requirements, a warning text will be shown
            if !check{
                Text("Please enter a valid quantity\n(only numbers above 0)")
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            
            // showing the price of the bev
            Text("💰: Rp. \(bev.price) each")
                .font(.subheadline)
                .bold()
                .padding(.vertical)
            
            // showing the total price based on the user input
            Text("💰: Rp. \(bev.price * (Int(quantity) ?? 0)) total")
                .font(.subheadline)
                .bold()
                .padding(.bottom)
            
            // to redirect the user to the purchase screen, the button will be disabled if the input does not meet the requirements
            NavigationLink(destination: PurchasedScreen(quantity: Int(quantity) ?? 0, name: bev.bevName, totalprice: bev.price * (Int(quantity) ?? 0))) {
                Text("Purchase")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(red: 0.4, green: 0.6, blue: 1.0))
                    .cornerRadius(10)
            }
            .disabled(!check)
            
            Spacer()
        }
        .onChange(of: quantity) { newValue in
            check = ((Int(newValue) ?? 0) >= 1)
        }
        .padding(.horizontal, 30)
    }
}

struct BevOrder_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        BevOrder(bev: modelData.bev[0])
            .environmentObject(modelData)
    }
}
