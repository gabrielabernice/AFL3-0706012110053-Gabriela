//
//  CafeDetail.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 01/05/23.
//

import SwiftUI

// to provide the cafe details which are showing foods and beverages of the cafe
struct CafeDetail: View {
    @EnvironmentObject var modelData: ModelData
    var cafe: Cafe
    var food: [Food]
    var bev: [Bev]
    
    var body: some View {
        TabView {
            FoodView(food: modelData.food.filter{$0.cafe == cafe.name})
                .tabItem {
                    Label("Food", systemImage: "fork.knife")
                }
            
            BevView(bev: modelData.bev.filter{$0.cafe == cafe.name})
                .tabItem {
                    Label("Beverages", systemImage: "cup")
                }
        }
    }
}

struct FoodView: View {
    var food: [Food]
    
    var body: some View {
        NavigationView {
            List(food) { foods in
                NavigationLink {
                    // order page
                } label: {
                    HStack {
                        Text(foods.foodName)
                        Spacer()
                        Text("Rp. \(foods.price)")
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Foods 🍽️")
        }
    }
}

struct BevView: View {
    var bev: [Bev]
    
    var body: some View {
        NavigationView {
            List(bev) { bevs in
                NavigationLink {
                    // order page
                } label: {
                    HStack {
                        Text(bevs.bevName)
                        Spacer()
                        Text("Rp. \(bevs.price)")
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Beverages 🍷")
        }
    }
}

struct CafeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        CafeDetail(cafe: modelData.cafe[0], food: modelData.food.filter{$0.cafe == "Tuku-Tuku"}, bev: modelData.bev.filter{$0.cafe == "Tuku-Tuku"})
            .environmentObject(modelData)
    }
}
