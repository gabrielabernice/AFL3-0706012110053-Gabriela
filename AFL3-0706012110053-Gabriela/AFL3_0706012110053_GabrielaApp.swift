//
//  AFL3_0706012110053_GabrielaApp.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 30/04/23.
//

import SwiftUI

@main
struct AFL3_0706012110053_GabrielaApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            
            MainScreen()
                .environmentObject(modelData)
        }
    }
}
