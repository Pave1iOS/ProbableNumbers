//
//  UISliderRepresentation.swift
//  ProbableNumbers
//
//  Created by Pavel Gribachev on 12.03.2024.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Int
    @Binding var target: Int
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .blue
        slider.maximumTrackTintColor = .darkGray
        
        slider.thumbTintColor = UIColor(
            red: 255,
            green: 0,
            blue: 0,
            alpha: context.coordinator.calculateAlpha()
        )
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueDidChange),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, target: $target)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Int
        @Binding var target: Int
        
        init(value: Binding<Int>, target: Binding<Int>) {
            self._value = value
            self._target = target
        }
        
        @objc func valueDidChange(_ sender: UISlider) {
            
            value = Int(sender.value)
            
            sender.thumbTintColor = UIColor(
                red: 255,
                green: 0,
                blue: 0,
                alpha: CGFloat(calculateAlpha())
            )
        }
                
        func calculateAlpha() -> Double {
            
            let value = Double(computeScore()) / 100
            let roundValue = round(value * 10) / 10
            
            print(roundValue)
            return roundValue
        }
        
        private func computeScore() -> Int {
            let difference = abs(value - target)
            return 100 - difference
        }
    }
}
