//
//  Cat.swift
//  CatFactsCodeGen
//
//  Created by Tatiana Lazarenko on 8/6/24.
//

import Foundation
import CatsAPI

final class Cat: ObservableObject {
    @Published var currentFact: CatFact?
    
    init() {
        loadRandomFact()
    }
    
    func loadRandomFact() {
        FactsAPI.getRandomFact { (fact, error) in
            if let fact = fact {
                self.currentFact = fact
            } else {
                print("Error loading fact: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    func nextFact() {
        loadRandomFact()
    }
}
