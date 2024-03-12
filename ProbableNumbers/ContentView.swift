//
//  ContentView.swift
//  ProbableNumbers
//
//  Created by Pavel Gribachev on 12.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Int = 20
    @State private var target = Int.random(in: 5...95)
    
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Подвиньте слайдер как можно ближе к \(target)")
                .font(.system(size: 16))
            .padding([.leading, .trailing], 10)
            
            HStack {
                Text("0")
                
                UISliderRepresentation(value: $value, target: $target)
                    .padding([.leading, .trailing], 10)
                
                Text("100")
            }
            .padding([.leading, .trailing], 15)
                    
            Button("Проверь меня!") {
                isPresented = true
            }
            .alert("You score", isPresented: $isPresented, actions: {
                Button("OK") {
                    target = randomNumber()
                }
            }, message: {
                Text(computeScore().formatted())
            })
            
            Button("Начать заново") {
                target = randomNumber()
            }
        }
    }
}

// MARK: Private func
private extension ContentView {
    private func randomNumber() -> Int {
        return Int.random(in: 5...95)
    }
    
    private func computeScore() -> Int {
        let difference = abs(value - target)
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
