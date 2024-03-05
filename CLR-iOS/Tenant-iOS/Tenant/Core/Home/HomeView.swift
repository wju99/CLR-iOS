import SwiftUI
import Crisp

struct HomeView: View{
    
    @State var isChatPresented = false
    @EnvironmentObject var viewModel: AuthViewModel

    init() {
        CrispSDK.configure(websiteID: "ecce1256-e95e-4d55-ba56-1d8d631be59c")
    }
    
    var body: some View {
        
        NavigationStack{
            HStack{
                VStack (alignment: .leading) {
                    Text("Le Jardin")
                        .font(
                        Font.custom("Inter", size: 20)
                        .weight(.bold)
                        )
                        .padding(.leading, 12)
                    
                    Image(.lejardin)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, alignment:.center)
                        .padding(.vertical, 10)
                    
                    List{
                        Button{
                            self.isChatPresented = true
                            CrispSDK.user.nickname = viewModel.currentUser?.fullName
                        } label: {
                            HomeMenuItemView(imageName: "message",
                                             title: "Contact US",
                                             description: "Live Chat")
                        }.foregroundColor(.black)
                        
                        //add get invoice
                        NavigationLink{
                            
                        } label: {
                            HomeMenuItemView(imageName: "newspaper",
                                             title: "Get Invoice",
                                             description: "View Statements")
                        }.foregroundColor(.black)
                        
                        //add view benefits
                        NavigationLink{
                            BenefitsView(benefitsViewModel: BenefitsViewModel())
                        } label: {
                            HomeMenuItemView(imageName: "gift",
                                             title: "View Benefits",
                                             description: "Delivery and more")
                        }.foregroundColor(.black)
                        
                        //add view resource pdf
                        NavigationLink{
                            ResourcesItemView(resourceName: "Mission Statement")
                        } label: {
                            HomeMenuItemView(imageName: "book.pages",
                                             title: "Resource PDF",
                                             description: "View Guide")
                        }.foregroundColor(.black)
            
                    }.listStyle(.plain)
                    
                }.navigationBarTitle("Home", displayMode: .inline)
                    .navigationBarItems(trailing:
                        Button(action: {
                            self.isChatPresented = true
                            CrispSDK.user.nickname = viewModel.currentUser?.fullName
                        }) {
                            Image(systemName: "message") // You can use any system icon or custom image
                                .imageScale(.large)
                        })
                .sheet(isPresented: self.$isChatPresented) {
                    ChatView()
                }
            }
        }
    }
    
}

#Preview {
    HomeView().environmentObject(AuthViewModel())
}
