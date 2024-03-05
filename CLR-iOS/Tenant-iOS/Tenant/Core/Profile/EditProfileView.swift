//
//  EditProfileView.swift
//  Tenant
//
//  Created by Will Ju on 11/29/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var fullName = ""
    
    var body: some View {
        // Uncomment line below to test this page
        GeometryReader { geometry in
            //let testUser = User(id:"dummyId", email: "test@test.com",
               //             fullName: "Jane Doe")
            if let user = viewModel.currentUser {
                NavigationStack{
                    VStack(spacing: 10){
                        Spacer().frame(height: 10)
                        
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 120, height: 120)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 1))
                        
                        
                        InputView(text: $fullName,
                                  title: "Full name",
                                  placeholder: user.fullName)
                        .autocapitalization(.none)
                        
                        HStack{
                            Text("Email address")
                                .font(Font.custom("Inter-Regular", size: 14))
                            Spacer()
                        }
                        
                        HStack{
                            Text(user.email)
                              .font(Font.custom("Inter-Regular", size: 14))
                              .foregroundColor(Color(red: 0.74, green: 0.74, blue: 0.74))
                            Spacer()
                            NavigationLink{
                                ChangeEmailView()
                            } label: {
                                Text("Edit").font(
                                    Font.custom("Inter-Regular", size: 15)
                                    .weight(.semibold)
                                    ).underline()
                            }
                        }
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                        .navigationTitle("Edit personal info")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(trailing:
                                                Button(action: {
                            if(!fullName.isEmpty){
                                self.viewModel.currentUser?.fullName = fullName
                            }
                        }) {
                            Text("Save")
                        })
                }
            }
        }
    }
}

#Preview {
    EditProfileView().environmentObject(AuthViewModel())
}
