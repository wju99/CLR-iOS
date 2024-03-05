//
//  LoginView.swift
//  Tenant
//
//  Created by Will Ju on 10/26/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @State var loginError: Bool
    
    init(){
        loginError = false
    }
    
    var body: some View {
        
        NavigationStack{
            VStack{
                //image
                Image(.cho)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:200, height:120)
                    .padding(.vertical, 32)
                
                //form fields
                VStack(spacing: 24){
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                    .autocapitalization(.none)
                    InputView(text: $password, 
                              title: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true)
                }.padding(.horizontal).autocapitalization(.none)
                
                Spacer().frame(height: 30)
                
                //sign in button
                Button{
                    Task{
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                    Task{
                        await delayedError()
                    }
                } label:{
                    HStack{
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                }.buttonStyle(BigButton(backgroundColor: .black, foregroundColor: .white))
                
                if(loginError){
                    HStack{
                        Text("Incorrect login credentials")
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                }
                
                Spacer().frame(height: 30)
                
                //sign up button
                NavigationLink{
                    //registrationView goes here
                    RegistrationView().navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have an account?")
                            .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51))
                        Text("Sign up")
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.22, green: 0.32, blue: 0.26))
                    }
                }.font(.system(size: 14))
                
                Spacer()
            }
        }
    }
    
    private func delayedError() async {
        // Delay of 7.5 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 1_200_000_000)
        print("*** LOGIN ERROR")
        loginError = true
    }
    
}



// check to see if form is valid
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty &&
        email.contains("@") &&
        !password.isEmpty &&
        password.count > 5
    }
}

#Preview {
    LoginView().environmentObject(AuthViewModel())
}
