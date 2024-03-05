//
//  ContentView.swift
//  Tenant
//
//  Created by Will Ju on 10/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                TenantView()
            }
            else{
                LandingView()
            }
        }
    }
    
}

#Preview {
    ContentView().environmentObject(AuthViewModel())
}
