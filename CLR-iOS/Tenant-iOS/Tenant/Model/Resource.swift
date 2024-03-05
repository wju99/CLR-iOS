//
//  Resource.swift
//  Tenant
//
//  Created by Will Ju on 10/27/23.
//

import Foundation

struct Resource: Identifiable {
    
    var id = UUID()
    var resourceName: String
    var resourceType: String
    
    init(resourceName: String, resourceType: String){
        self.resourceName = resourceName
        self.resourceType = resourceType
    }
    
}
