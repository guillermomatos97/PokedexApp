//
//  PokedexViewModel.swift
//  PokedexApp
//
//  Created by Guillermo Matos on 14/09/23.
//

import Foundation

class PokedexViewModel {
    
    var pokedex: Pokedex?
    var pokemon: Pokemon?
    
    func getPokedex(url: String = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0", completion: @escaping (Pokedex?)->Void ) {
        NetworkManager.fetchDataPokedex(urlSrting: url) { pokedex in
            
            if let pokedex {
                self.pokedex = pokedex
                completion(pokedex)
            }
        }
    }
    
    func getPokemon(url: String, completion: @escaping (Pokemon?)->Void ) {
        NetworkManager.fetchDataPokemon(urlSrting: url) { pokemon in
            if let pokemon {
                self.pokemon = pokemon
                completion(pokemon)
            }
        }
  
    }
    
    
    
}
