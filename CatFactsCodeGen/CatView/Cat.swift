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
    @Published var isLoading = true
    
    init() {
        loadRandomFact()
    }
    
    func loadRandomFact() {
        isLoading = true
        FactsAPI.getRandomFact { [weak self] (fact, error) in
            guard let self else { return }
            
            if let fact = fact {
                currentFact = fact
            } else {
                print("Error loading fact: \(String(describing: error?.localizedDescription))")
            }
            isLoading = false
        }
    }
    
    func nextFact() {
        loadRandomFact()
    }
}
