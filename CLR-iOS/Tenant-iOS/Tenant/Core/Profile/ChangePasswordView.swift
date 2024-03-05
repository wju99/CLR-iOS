//
//  ChangePasswordView.swift
//  Tenant
//
//  Created by Will Ju on 11/15/23.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @State private var oldPassword = ""
    @State private var newPassword = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 24){
            InputView(text: $oldPassword,
                      title: "Password",
                      placeholder: "Enter Old Password",
                      isSecureField: true)
            .autocapitalization(.none)
            InputView(text: $newPassword,
                      title: "New Password",
                      placeholder: "Create New Password",
                      isSecureField: true)
            InputView(text: $confirmPassword,
                      title: "Confirm Password",
                      placeholder: "Confirm New Password",
                      isSecureField: true)
            Button {
                Task {
                    print("Changing password..")
                    try await viewModel.changePassword(newPassword: newPassword, confirmPassword: confirmPassword)
                }
            } label: {
                Text("Reset Password")
            }.buttonStyle(ProfileButton(backgroundColor: .black,
                                        foregroundColor: .white))
        }.padding(.horizontal).autocapitalization(.none)
    }
}

#Preview {
    ChangePasswordView()
}
