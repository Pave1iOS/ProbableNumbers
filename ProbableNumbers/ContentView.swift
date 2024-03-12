//
//  ContentView.swift
//  ProbableNumbers
//
//  Created by Pavel Gribachev on 12.03.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 20
    @State private var target = Int.random(in: 5...95)
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Подвиньте слайдер как можно ближе к \(target)")
                .font(.system(size: 16))
            .padding([.leading, .trailing], 10)
        
            UISliderRepresentation(value: $value, target: $target)
                .padding([.leading, .trailing], 10)
                
            Text(value.formatted())
            
            Button("Проверь меня!") {
                target = Int.random(in: 5...95)
            }
            
            Button("Начать заного") {
                
            }
        }
    }
}



#Preview {
    ContentView()
}
