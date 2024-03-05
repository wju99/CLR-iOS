//
//  RegistrationView.swift
//  Tenant
//
//  Created by Will Ju on 10/26/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var confirmPassword = ""
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                Image(.cho)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:200, height:120)
                    .padding(.vertical, 32)

                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    
                    InputView(text: $fullName,
                              title: "Full Name",
                              placeholder: "Enter your name")
                    
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                    .autocapitalization(.none)
                    
                    InputView(text: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    .autocapitalization(.none)
                    
                }.padding(.horizontal)
                
                Spacer().frame(height: 30)
                
                Button{
                    Task{
                        try await viewModel.createUser(withEmail: email,
                                                         password: password,
                                                         fullName: fullName)
                    }
                } label: {
                    HStack{
                        Text("Sign Up")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                }.buttonStyle(BigButton(backgroundColor: .black, foregroundColor: .white))
                
                Spacer().frame(height: 30)
                
                NavigationLink{
                    LoginView().navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                            .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                        Text("Sign in")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.22, green: 0.32, blue: 0.26))
                        
                    }
                }.font(.system(size: 14))
                
                Spacer()
                
            }
        }
    }
}

//check to see if registration form is valid
extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5 &&
        !confirmPassword.isEmpty &&
        password == confirmPassword &&
        !fullName.isEmpty
    }
}

#Preview {
    RegistrationView().environmentObject(AuthViewModel())
}
