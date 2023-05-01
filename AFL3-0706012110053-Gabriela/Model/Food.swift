//
//  Food.swift
//  AFL3-0706012110053-Gabriela
//
//  Created by MacBook Pro on 30/04/23.
//

import Foundation

struct Food: Hashable, Codable, Identifiable{
    var id: Int
    var foodName: String
    var price: Int
    var cafe: String
}
