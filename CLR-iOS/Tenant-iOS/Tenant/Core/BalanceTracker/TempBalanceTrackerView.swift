//
//  TempBalanceTrackerView.swift
//  Tenant
//
//  Created by Will Ju on 12/5/23.
//

import SwiftUI

struct TempBalanceTrackerView: View {
    // Assuming you have a viewModel that provides the balance
    @State private var balance: Double = 975 // This would typically be fetched from a view model or similar

    var body: some View {
        NavigationStack{
            VStack {
                Spacer()

                // Balance display
                ZStack {
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(Color.gray)

                    Text("Total\n$\(balance, specifier: "%.2f")")
                        .font(
                        Font.custom("Inter-Regular", size: 28)
                        .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                }
                .frame(width: 200, height: 200)

                Spacer()

                // Buttons for viewing statements and paying balance
                VStack(spacing: 16) {
                    Button(action: {
                        // Action to view statements
                    }) {
                        Text("View Statements")
                    }.buttonStyle(ProfileButton(backgroundColor: .white, foregroundColor: .black))

                    Button(action: {
                        // Action to pay balance
                    }) {
                        Text("Pay Balance")
                    }.buttonStyle(ProfileButton(backgroundColor: .black, foregroundColor: .white))
                }
                .padding()

                Spacer()
            }.navigationBarTitle("Balance Tracker", displayMode: .inline)
        }
    }
}

#Preview {
    TempBalanceTrackerView()
}
