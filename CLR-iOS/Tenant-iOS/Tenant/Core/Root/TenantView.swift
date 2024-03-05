//
//  TenantView.swift
//  Tenant
//
//  Created by Will Ju on 11/7/23.
//

import SwiftUI

struct TenantView: View{
    
   @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View{
        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }
            BenefitsView(benefitsViewModel: BenefitsViewModel()).tabItem {
                Label("Benefits", systemImage: "list.dash")
            }
            TempBalanceTrackerView().tabItem {
                Label("Payment", systemImage: "creditcard")
            }
            ProfileView().tabItem {
                Label("Profile", systemImage: "person")
            }
        }
    }
    
}

#Preview {
    TenantView().environmentObject(AuthViewModel())
}
