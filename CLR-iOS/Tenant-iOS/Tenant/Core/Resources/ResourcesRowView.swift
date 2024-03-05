//
//  ResourcesRowView.swift
//  Tenant
//
//  Created by Will Ju on 10/24/23.
//

import SwiftUI

struct ResourcesRowView: View {
    
    var resource: Resource
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(resource.resourceName)
                .font(.headline)
            Text("Type: " + resource.resourceType)
                .font(.subheadline)
        }
        Spacer()
    }
    
}

#Preview {
    ResourcesRowView(resource: Resource(resourceName: "Test Resource", resourceType: "Test Type"))
}
