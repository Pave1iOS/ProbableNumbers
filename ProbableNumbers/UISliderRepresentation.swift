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
                alpha: CGFloat(calculateAlpha(value, secondValue: target))
            )
        }
        
        private func computerScore() -> Int {
            let difference = abs(target - value)
                return 100 - difference
        }
        
        private func calculateAlpha(_ firstValue: Int, secondValue: Int) -> Float {
            var alpha: Float = 100
            
            if firstValue > secondValue {
                alpha = 1 - ((Float(firstValue) - Float(secondValue)) / 100)
                print(alpha)
            } else {
                alpha = 1 - ((Float(secondValue) - Float(firstValue)) / 100)
                print(alpha)
            }
            
            return alpha
        }
    }
}
