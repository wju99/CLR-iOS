//
//  ProfileButton.swift
//  Tenant
//
//  Created by Will Ju on 11/14/23.
//

import SwiftUI

struct ProfileButton: ButtonStyle {
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .frame(width: 343, alignment: .top)
            .background(backgroundColor)
            .cornerRadius(16)
            .font(Font.custom("Inter", size: 18).weight(.semibold))
            .lineSpacing(18)
            .foregroundColor(foregroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: 16) // Same rounded rectangle as in the clipShape
                    .stroke(Color.black, lineWidth: 2) // Stroke color and width for the border
            )
    }
}
