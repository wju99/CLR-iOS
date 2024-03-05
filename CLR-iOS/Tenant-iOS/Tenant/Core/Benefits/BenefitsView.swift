//
//  BenefitsView.swift
//  Tenant
//
//  Created by Will Ju on 10/20/23.
//

import SwiftUI

class BenefitsViewModel: ObservableObject{
    
    @Published var benefits: [Benefit] = populateBenefits()
    
}
struct BenefitsView: View {
    
    @ObservedObject var benefitsViewModel: BenefitsViewModel
    @State var category: String = ""
    @State private var filteredBenefits: [Benefit] = []
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 8){
                Spacer().frame(height: 2)
                BenefitsFilterView(category: $category)
                Text(category)
                    .font(.headline)
                    .padding(.leading)
                    .padding(.top, 8)
                List{
                    ForEach(filteredBenefits) { benefit in
                        NavigationLink{
                            BenefitsItemView(benefit: benefit)
                        }
                        label: {
                            BenefitsRowView(benefit: benefit)
                                    .background(Color.white
                                        .shadow(color: .black.opacity(0.25), radius: 2, x: -2, y: 4))
                                    .listRowInsets(EdgeInsets())
                                    
                        }.listRowSeparator(.hidden)
                        
                    }
                }   .onChange(of: category){
                        if(category != ""){
                            filteredBenefits = benefitsViewModel.benefits.filter({
                            $0.benefitCategory.starts(with: category)
                            })
                        }
                        else{
                            filteredBenefits = benefitsViewModel.benefits
                        }
                    }
                    .onAppear{
                        filteredBenefits = benefitsViewModel.benefits
                        category = ""
                    }
                .navigationTitle("Client Benefits")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(.plain)
            }
        }
    }
    
}

func populateBenefits() -> [Benefit] {
    
    var tempBenefits: [Benefit] = []
    
    let postmatesBenefit = Benefit(benefitName: "Food Delivery (50% Off)",
                              benefitPrice: 40.0,
                              benefitImage: Image(.postmates),
                              benefitCategory: "Dining",
                              benefitDetails: "Whether it's for a special event or just hanging out with friends, order Postmates delivery for 50% off.",
                              benefitTerms: "Limit to 2 complimentary orders per month per residence.")
    tempBenefits.append(postmatesBenefit)
    
    let travelBenefit = Benefit(benefitName: "Travel Planning",
                              benefitPrice: 0.0,
                              benefitImage: Image(.travel),
                              benefitCategory: "Service",
                              benefitDetails: "Your Gateway to Effortless Travel Adventures. From securing the best flight deals to handpicking unique accommodations and immersive local experiences, we handle every detail.",
                              benefitTerms: "Benefits offered are subject to change at the discretion of Cho Luxury Rentals, with or without prior notice.")
    tempBenefits.append(travelBenefit)
    
    let serviceBenefit = Benefit(benefitName: "Maintenance Request",
                              benefitPrice: 0.0,
                              benefitImage: Image(.maintenance),
                              benefitCategory: "Service",
                              benefitDetails: "Our maintenance service offers timely repair and upkeep solutions for residential properties, ensuring a smooth and uninterrupted stay.",
                              benefitTerms: "Benefits offered are subject to change at the discretion of Cho Luxury Rentals, with or without prior notice.")
    tempBenefits.append(serviceBenefit)
    
    let streamingBenefit = Benefit(benefitName: "Streaming Access",
                              benefitPrice: 0.0,
                              benefitImage: Image(.stream),
                              benefitCategory: "Entertainment",
                              benefitDetails: "Your home comes fully equipped with the following streaming services: Netflix, Disney+, Hulu, ESPN+",
                              benefitTerms: "Benefits offered are subject to change at the discretion of Cho Luxury Rentals, with or without prior notice. Subject to all terms and conditions of the third-party vendors.")
    tempBenefits.append(streamingBenefit)
    
    let amazonPrimeBenefit = Benefit(benefitName: "Amazon Prime Service",
                              benefitPrice: 0.0,
                              benefitImage: Image(.amazon),
                              benefitCategory: "Shopping",
                              benefitDetails: "Personalized Amazon Prime account is included with rental of a CLR property. Learn how to access your account below",
                              benefitTerms: "Benefits offered are subject to change at the discretion of Cho Luxury Rentals, with or without prior notice. Subject to all terms and conditions of the third-party vendors.")
    tempBenefits.append(amazonPrimeBenefit)
    
    return tempBenefits
    
}

#Preview {
    BenefitsView(benefitsViewModel: BenefitsViewModel())
}
