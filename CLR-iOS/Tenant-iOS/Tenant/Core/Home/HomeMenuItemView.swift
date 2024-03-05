//
//  HomeMenuItemView.swift
//  Tenant
//
//  Created by Will Ju on 11/11/23.
//

import SwiftUI

struct HomeMenuItemView: View {
    
    let imageName: String
    let title: String
    let description: String?
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
                .frame(alignment:.leading)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                if let description = description {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    HomeMenuItemView(imageName: "message", title: "Contact US", description: "Live Chat")
}
