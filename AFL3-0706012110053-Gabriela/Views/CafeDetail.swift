//
//  CafeDetail.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 01/05/23.
//

import SwiftUI

// to provide the cafe details which are showing foods and beverages of the cafe, that is being seperated into two different tabs (foods and beverages)
struct CafeDetail: View {
    @EnvironmentObject var modelData: ModelData
    var cafe: Cafe
    var food: [Food]
    var bev: [Bev]
    
    var body: some View {
        TabView {
            FoodView(food: food)
                .tabItem {
                    Label("Food", systemImage: "fork.knife")
                }
            
            BevView(bev: bev)
                .tabItem {
                    Label("Beverages", systemImage: "wineglass")
                }
        }
    }
}

// to make the food list of the cafe and its price
struct FoodView: View {
    var food: [Food]
    
    var body: some View {
        NavigationView {
            List(food) { foods in
                NavigationLink {
                    FoodOrder(food: foods)
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

// to make the bev list of the cafe and its price
struct BevView: View {
    var bev: [Bev]
    
    var body: some View {
        NavigationView {
            List(bev) { bevs in
                NavigationLink {
                    BevOrder(bev: bevs)
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
