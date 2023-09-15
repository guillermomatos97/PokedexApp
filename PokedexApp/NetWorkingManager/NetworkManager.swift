//
//  networkManager.swift
//  PokedexApp
//
//  Created by Guillermo Matos on 14/09/23.
//

import Foundation

class NetworkManager {
    class func fetchDataPokedex (urlSrting: String, completion: @escaping (Pokedex?) -> Void ) {
        guard let url = URL(string: urlSrting) else {return}
        
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data {
                let pokedexModel = try? JSONDecoder().decode(Pokedex.self, from: data)
                completion(pokedexModel)
            }
        }
        task.resume()
    }
    
    class func fetchDataPokemon (urlSrting: String, completion: @escaping (Pokemon?) -> Void ) {
        guard let url = URL(string: urlSrting) else {return}
        
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let data {
                let pokemonModel = try? JSONDecoder().decode(Pokemon.self, from: data)
                completion(pokemonModel)
            }
        }
        task.resume()
    }

}
