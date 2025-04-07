//
//  CustomBackgroundView.swift
//  HikeUdemy
//
//  Created by Vaibhav Upadhyay on 06/02/25.
//
import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3. Dept
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            // MARK: - 2. Light
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            // MARK: - 1. Surface
            LinearGradient(
                colors: [
                    Color.customGreenLight,
                    Color.customGreenDark
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
}

#Preview {
    CustomBackgroundView()
}
