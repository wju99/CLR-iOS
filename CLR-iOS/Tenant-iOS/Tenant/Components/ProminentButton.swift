//
//  SwiftUIView.swift
//  Tenant
//
//  Created by Will Ju on 11/25/23.
//

import SwiftUI

struct ProminentButton: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var borderColor: Color = Color(red: 0.22, green: 0.32, blue: 0.26)
    var borderWidth: CGFloat = 2
    var cornerRadius: CGFloat = 20
    var shadowColor: Color = .gray
    var shadowRadius: CGFloat = 0
    var padding: CGFloat = 10

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(padding)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(cornerRadius)
            .shadow(color: shadowColor, radius: shadowRadius)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
