//
//  Benefit.swift
//  Tenant
//
//  Created by Will Ju on 10/27/23.
//

import Foundation
import SwiftUI

struct Benefit: Identifiable {
    
    var id = UUID()
    var benefitName: String
    var benefitPrice: Double
    var benefitImage: Image
    var benefitCategory: String
    var benefitDetails: String
    var benefitTerms: String
    
    init(benefitName: String, benefitPrice: Double, benefitImage: Image, benefitCategory: String, benefitDetails: String, benefitTerms: String){
        self.benefitName = benefitName
        self.benefitPrice = benefitPrice
        self.benefitImage = benefitImage
        self.benefitCategory = benefitCategory
        self.benefitDetails = benefitDetails
        self.benefitTerms = benefitTerms
    }
    
}
