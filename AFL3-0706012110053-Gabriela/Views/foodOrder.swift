//
//  foodOrder.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 01/05/23.
//

import SwiftUI

struct foodOrder: View {
    @State var quantity: String = ""
    @EnvironmentObject var modelData: ModelData
    var food: Food
    
    @State var check: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("How many \(food.foodName) do you want to buy?")
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
            
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
            
            if !check{
                Text("Please enter a valid quantity\n(only numbers above 0)")
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
            }
            
            Text("💰: Rp. \(food.price) each")
                .font(.subheadline)
                .bold()
                .padding(.vertical)
            
            Text("💰: Rp. \(food.price * (Int(quantity) ?? 0)) total")
                .font(.subheadline)
                .bold()
                .padding(.bottom)
            
            Button(action: {
                // Code to be executed when the button is tapped
                print("Button tapped!")
            }) {
                Text("Add to cart")
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

struct foodOrder_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        foodOrder(food: modelData.food[0])
            .environmentObject(modelData)
    }
}
