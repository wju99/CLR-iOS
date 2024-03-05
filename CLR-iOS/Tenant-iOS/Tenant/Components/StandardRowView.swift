//
//  StandardRowView.swift
//  Tenant
//
//  Created by Will Ju on 10/27/23.
//

import SwiftUI

struct StandardRowView: View {
    
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
                .padding(.horizontal, 15)
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    StandardRowView(imageName: "gear", title: "Privacy Policy", tintColor: Color(.systemGray))
}
