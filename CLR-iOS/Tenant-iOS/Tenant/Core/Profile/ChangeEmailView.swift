//
//  ChangeEmailView.swift
//  Tenant
//
//  Created by Will Ju on 11/29/23.
//

import SwiftUI

struct ChangeEmailView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    
    var body: some View {
        if let user = viewModel.currentUser {
            NavigationStack{
                VStack{
                    Spacer().frame(height:12)
                    InputView(text: $email,
                              title: "Email address",
                              placeholder: user.email)
                    .autocapitalization(.none)
                    Spacer()
                }.padding(.leading, 10)
                    .navigationTitle("Edit personal info")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:
                                            Button(action: {
                        if(!email.isEmpty){
                            self.viewModel.currentUser?.email = email
                        }
                    }) {
                        Text("Save")
                    })

            }
        }
    }
}

#Preview {
    ChangeEmailView().environmentObject(AuthViewModel())
}
