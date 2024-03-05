//
//  ProfileView.swift
//  Tenant
//
//  Created by Will Ju on 10/20/23.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack{
            
            NavigationStack{
                // Comment out line below to test this page
                if let user = viewModel.currentUser{
                // Uncomment line below to test this page
               /* let user = User(id:"dummyId", email: "test@test.com",
                                fullName: "Jane Doe")*/
                    HStack(spacing: 24) {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 100, height: 100)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 1))
                        
                        VStack(alignment: .leading) {
                            Text(user.fullName).font(.system(size: 20, weight: .bold))
                            
                            NavigationLink {
                                EditProfileView()
                            } label:{
                                Text("Edit")
                            }
                            .foregroundColor(.blue)
                        }
                        
                        Spacer().frame(width:120)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    
                    List{
                        Section {
                            NavigationLink{
                                //Navigate to PrivacyPolicyView
                            } label: {
                                StandardRowView(imageName: "checkmark.shield", title: "Privacy Policy", tintColor: Color(.black))
                                    .listRowInsets(EdgeInsets(top: 30,
                                                              leading: 30,
                                                              bottom: 30,
                                                              trailing:20))
                            }
                            NavigationLink{
                                ChangePasswordView()
                            } label: {
                                StandardRowView(imageName: "lock", title: "Security & Password", tintColor: Color(.black))
                                    .listRowInsets(EdgeInsets(top: 50, 
                                                              leading: 30,
                                                              bottom: 20,
                                                              trailing: 20))
                            }
                            NavigationLink{
                                // Navigate to Help View
                            } label: {
                                StandardRowView(imageName: "questionmark.circle", title: "Help Center", tintColor: Color(.black))
                                    .listRowInsets(EdgeInsets(top: 50,
                                                              leading: 30,
                                                              bottom: 20,
                                                              trailing: 20))
                            }
                            NavigationLink{
                                // Navigate to Notifications View
                            } label: {
                                StandardRowView(imageName: "bell", title: "Notifications", tintColor: Color(.black))
                                    .listRowInsets(EdgeInsets(top: 50, 
                                                              leading: 30,
                                                              bottom: 20,
                                                              trailing: 20))
                            }
                        }
                    }
                    .listStyle(.plain)
                    .navigationBarTitle("Profile", displayMode: .inline)
                    
                    NavigationLink{
                        // Switch to host flow
                    } label: {
                        Text("Switch to Host").fontWeight(.semibold)
                    }.buttonStyle(ProfileButton(backgroundColor: .white, foregroundColor: .black))
                    
                    Spacer().frame(height:20)
                    
                    Button{
                        print("Sign out..")
                        viewModel.signOut()
                    } label: {
                        Text("Sign Out")
                    }.buttonStyle(ProfileButton(backgroundColor: .black, foregroundColor: .white))
                    Spacer().frame(height:20)
                }
            }
        }
    }
}

#Preview {
    ProfileView().environmentObject(AuthViewModel())
}

