//
//  BenefitRowView.swift
//  Tenant
//
//  Created by Will Ju on 10/21/23.
//

import SwiftUI

struct BenefitsRowView: View {
    
    var benefit: Benefit
    
    var body: some View {
        HStack(alignment: .top) {
            benefit.benefitImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 83, height: 83)
                .clipped()
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(benefit.benefitName)
                    .font(.headline)
                Text(benefit.benefitCategory)
                    .font(.subheadline)
                    .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
            }
            Spacer()
        }
    }
    
}

#Preview{
    BenefitsRowView(benefit: Benefit(benefitName: "Test Benefit", benefitPrice: 0.0, benefitImage: Image(.icon), benefitCategory: "Test Category", benefitDetails: "Test Details", benefitTerms: "Test Terms"))
}
