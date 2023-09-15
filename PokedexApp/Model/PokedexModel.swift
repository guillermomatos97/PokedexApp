//
//  PokedexModel.swift
//  PokedexApp
//
//  Created by Guillermo Matos on 14/09/23.
//

import Foundation
// MARK: - Pokedex
struct Pokedex: Codable {
    var count: Int?
    var next, previous: String?
    var results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    var name: String?
    var url: String?
}
