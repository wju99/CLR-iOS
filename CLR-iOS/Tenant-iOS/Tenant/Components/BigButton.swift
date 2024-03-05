//
//  BigButtonView.swift
//  Tenant
//
//  Created by Will Ju on 11/8/23.
//

import SwiftUI

struct BigButton: ButtonStyle {
    
    var backgroundColor: Color
    var foregroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 10)
            .padding(.vertical, 15)
            .frame(width: 343, alignment: .top)
            .background(backgroundColor)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.25), radius: 7, x: 0, y: 0)
            .font(Font.custom("Inter", size: 18).weight(.semibold))
            .lineSpacing(18)
            .foregroundColor(foregroundColor)
    }
}
