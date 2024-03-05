//
//  BenefitRowView.swift
//  Tenant
//
//  Created by Will Ju on 10/21/23.
//

import SwiftUI

struct BenefitsItemView: View {
    
    var benefit: Benefit
    
    var body: some View {

        VStack(alignment: .leading, spacing: 18) {
            Spacer().frame(height:8)
            benefit.benefitImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 212)
                .clipped()
                .padding(.leading, -20)
                .padding(.trailing, -20)
            Text(benefit.benefitName)
            .fontWeight(.semibold)
            .font(Font.custom("Inter-Regular", size: 24))
            .padding(.leading, -4)
            ZStack{
                Rectangle()
                  .foregroundColor(.clear)
                  .frame(width: 120, height: 32)
                  .background(Color(red: 0.22, green: 0.32, blue: 0.26))
                  .cornerRadius(14)
                
                Text(benefit.benefitCategory)
                    .font(.subheadline
                  )
                  .foregroundColor(.white)
                  .lineLimit(1)
                  .truncationMode(.tail)
                  .frame(width: 64.77778, alignment: .center)
                  .minimumScaleFactor(0.5)
            }

            Text("Benefits Details")
            .font(
            Font.custom("Inter", size: 14)
            .weight(.medium)
            )
            .kerning(1)
            .foregroundColor(.black)
            
            Text(benefit.benefitDetails)
              .font(Font.custom("Inter", size: 12))
              .kerning(1)
              .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
            
            Text("Benefits Terms And Policy")
            .font(
            Font.custom("Inter", size: 14)
            .weight(.medium)
            )
            .kerning(1)
            .foregroundColor(.black)
            
            Text(benefit.benefitTerms)
              .font(Font.custom("Inter", size: 12))
              .kerning(1)
              .foregroundColor(Color(red: 0.28, green: 0.28, blue: 0.28))
            Spacer()
        }.padding(.leading, 20)
            .padding(.trailing, 20)
    }
    
}

#Preview {
    BenefitsItemView(benefit: Benefit(benefitName: "Food Delivery (50% Off)", benefitPrice: 0.0, benefitImage: Image(.postmates), benefitCategory: "Dining", benefitDetails: "Whether it's for a special event or just hanging out with friends, order Postmates delivery for 50% off.", benefitTerms: "Limit to 2 complimentary orders per month per residence."))
}
