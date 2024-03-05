//
//  ResourcesView.swift
//  Tenant
//
//  Created by Will Ju on 10/20/23.
//

import SwiftUI

class ResourcesViewModel: ObservableObject{
    
    @Published var resources: [Resource] = populateResources()
    
}

struct ResourcesView: View {
    
    @ObservedObject var resourcesViewModel: ResourcesViewModel
    @State private var searchText: String = ""
    @State private var filteredResources: [Resource] = []
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(filteredResources) { resource in
                    NavigationLink{
                        ResourcesItemView(resourceName: resource.resourceName)
                    }
                    label: {
                        ResourcesRowView(resource: resource)
                    }
                }
            }.searchable(text: $searchText)
                .onChange(of: searchText){
                    if(searchText != ""){
                        filteredResources = resourcesViewModel.resources.filter({
                        $0.resourceName.starts(with: searchText)
                        })
                    }
                    else{
                        filteredResources = resourcesViewModel.resources
                    }
                }
                .onAppear{
                    filteredResources = resourcesViewModel.resources
                }
            .navigationTitle("Resources").font(.title3)
        }
    }
    
}

func populateResources() -> [Resource] {
    
    var tempResources: [Resource] = []
    let testResource1 = Resource(resourceName: "Mission Statement",
                                     resourceType: "Test Type")
    tempResources.append(testResource1)
    return tempResources
    
}

#Preview {
    ResourcesView(resourcesViewModel: ResourcesViewModel())
}
