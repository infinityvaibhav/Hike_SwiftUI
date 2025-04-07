//
//  GradientButtonStyle.swift
//  HikeUdemy
//
//  Created by Vaibhav Upadhyay on 20/02/25.
//
import SwiftUI

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Condional statement with ternary operator
                // Condition ? A : B
                configuration.isPressed ?
                
                // A: When user pressed the Button
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                // B: When the Button is not pressed
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
            
    }
}
    
