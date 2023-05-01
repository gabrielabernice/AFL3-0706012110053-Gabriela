//
//  ModelData.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 30/04/23.
//

import Foundation
import Combine

// to load the data of food and bev
final class ModelData: ObservableObject {
    @Published var food: [Food] = load("foodData.json")
    @Published var bev: [Bev] = load("bevData.json")
    @Published var cafe: [Cafe] = load("cafeData.json")
}

// if the data cannot be loaded
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
