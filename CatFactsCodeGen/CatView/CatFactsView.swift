//
//  CatFactsView.swift
//  CatFactsCodeGen
//
//  Created by Tatiana Lazarenko on 8/6/24.
//

import SwiftUI
import CatsAPI

struct CatFactsView: View {
    @StateObject private var cat = Cat()
    
    var body: some View {
        VStack {
            Text("Random fact about cats")
                .font(.system(size: 28, weight: .bold))
                .padding(.top, 150)
            
            switch cat.isLoading {
            case true:
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding(.top, 40)
            case false:
                if let fact = cat.currentFact {
                    Text("\(fact.fact ?? "fact")")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    Text("error")
                }
            }
            
            Spacer()
            
            Button(action: {
                cat.nextFact()
            }) {
                Text("Next fact")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
        }
        .padding()
    }
}


#Preview {
    CatFactsView()
}
