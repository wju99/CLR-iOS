//
//  BenefitsFilterView.swift
//  Tenant
//
//  Created by Will Ju on 10/24/23.
//

import SwiftUI

struct BenefitsFilterView: View {
    
    @Binding var category: String
    var dining: String = "Dining"
    var service: String = "Service"
    var entertainment: String = "Entertainment"
    var shopping: String = "Shopping"
    
    var body: some View {
        VStack(alignment: .leading){
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Spacer().frame(width:10)
                    Button(dining){
                        triggerBenefitButton(filteredCategory: dining)
                    }.fontWeight(.semibold)
                    Button(service){
                        triggerBenefitButton(filteredCategory: service)
                    }.fontWeight(.semibold)
                    Button(entertainment){
                        triggerBenefitButton(filteredCategory: entertainment)
                    }.fontWeight(.semibold)
                    Button(shopping){
                        triggerBenefitButton(filteredCategory: shopping)
                    }.fontWeight(.semibold)
                }.buttonStyle(ProminentButton(backgroundColor: .white, foregroundColor: Color(red: 0.22, green: 0.32, blue: 0.26)))
                .controlSize(.small)
            }
        }
    }
    
    func triggerBenefitButton(filteredCategory: String){
        if(category == filteredCategory){
            category = ""
        }
        else{
            category = filteredCategory
        }
    }
    
}
