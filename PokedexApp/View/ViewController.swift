//
//  ViewController.swift
//  PokedexApp
//
//  Created by Guillermo Matos on 14/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var specialDefenseLabel: UILabel!
    @IBOutlet weak var specialAtackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var atackLabel: UILabel!
    
    
    let viewModel = PokedexViewModel()
    var pokemonInfo: Pokemon?
    var pokedexInfo: Pokedex?
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPokedexInfo()
        self.showPokemon()
        self.timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(refreshPokedex), userInfo: nil, repeats: true)

    }
    
    @objc func refreshPokedex(){
        showPokemon()
    }
    
    func loadPokedexInfo(){
        self.viewModel.getPokedex { pokedex in
            self.pokedexInfo = pokedex
        }
    }
    
    func showPokemon(){
        let random = Int.random(in: 1...(pokedexInfo?.results?.count ?? 1281))
        if let pokemonUrl = pokedexInfo?.results?[random].url{
            self.viewModel.getPokemon(url: pokemonUrl) { pokemon in
                self.pokemonInfo = pokemon
                self.updateView()
                
            }
        }
    }
    
    
    
    func updateView(){
        DispatchQueue.main.async {
            self.pokeName.text = self.pokemonInfo?.name?.uppercased()
            self.hpLabel.text = String(self.pokemonInfo?.stats?[0].baseStat ?? 0)
            self.atackLabel.text = String(self.pokemonInfo?.stats?[1].baseStat ?? 0)
            self.defenseLabel.text = String(self.pokemonInfo?.stats?[2].baseStat ?? 0)
            self.specialAtackLabel.text = String(self.pokemonInfo?.stats?[3].baseStat ?? 0)
            self.specialDefenseLabel.text = String(self.pokemonInfo?.stats?[4].baseStat ?? 0)
            self.speedLabel.text = String(self.pokemonInfo?.stats?[5].baseStat ?? 0)
            guard let imagePokemonString = self.pokemonInfo?.sprites?.frontDefault else {return}
            if let imagePokemonUrl = URL(string: imagePokemonString) {
                    self.pokeImage.load(url: imagePokemonUrl)
            }
        }
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        self.showPokemon()
        
    }
    

}



