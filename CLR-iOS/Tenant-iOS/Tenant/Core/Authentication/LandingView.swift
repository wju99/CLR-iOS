//
//  LandingView.swift
//  Tenant
//
//  Created by Will Ju on 11/8/23.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.center){
                Image(.landing)
                    .resizable()
                    .padding(.vertical, 32)
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth:.infinity, maxHeight: 610)
                    .scaledToFill()
                
        
                Text("Welcome")
                  .font(Font.custom("Alta_regular", size: 48))
                  .lineSpacing(57.60)
                  .foregroundColor(Color(red: 0.22, green: 0.22, blue: 0.22))
                
                NavigationLink {
                    RegistrationView().navigationBarBackButtonHidden()
                } label: {
                    Text("Get Started").fontWeight(.semibold)
                }.buttonStyle(BigButton(backgroundColor: .black, foregroundColor: .white))
                    .padding(.vertical, 10)
                
                NavigationLink {
                    LoginView().navigationBarBackButtonHidden()
                } label: {
                    Text("I'm already a member")
                        .foregroundColor(Color(red: 0.22, green: 0.22, blue: 0.22))
                        .fontWeight(.semibold)
                }.font(.system(size: 16))
                
                
                Spacer().frame(height:150)
            }
        }

    }
}

#Preview {
    LandingView()
}
