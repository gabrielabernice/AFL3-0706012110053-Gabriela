//
//  MainScreen.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI

struct MainScreen: View {
    @EnvironmentObject var modelData: ModelData
    var cafes: [Cafe]{
        modelData.cafe
    }
    
    var foods: [Food]{
        modelData.food
    }
    
    var bevs: [Bev]{
        modelData.bev
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // to list all of the cafes and redirect the user to cafedetail screen after selecting the cafe
                List(cafes) { cafe in
                    NavigationLink {
                        CafeDetail(cafe: cafe, food: foods.filter { $0.cafe == cafe.name }, bev: bevs.filter{$0.cafe == cafe.name})
                    } label: {
                        VStack(alignment: .leading) {
                            Text(cafe.name)
                        }
                    }
                    .padding(.vertical)
                    .tag(cafe)
                }
                
                // to make the shopping cart button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: ShoppingCart()) {
                            Image(systemName: "cart")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                        .padding()
                        .background(Color(red: 0.4, green: 0.6, blue: 1.0))
                        .clipShape(Circle())
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                    }
                }
                
                .navigationTitle("UC-Walk Cafeteria 👨🏻‍🍳👩🏻‍🍳")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    @EnvironmentObject var modelData: ModelData
    
    static var previews: some View {
        MainScreen()
            .environmentObject(ModelData())
    }
}
