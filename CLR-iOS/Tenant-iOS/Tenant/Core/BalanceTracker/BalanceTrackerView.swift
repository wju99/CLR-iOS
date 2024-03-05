//
//  BalanceTrackerView.swift
//  Tenant
//
//  Created by Will Ju on 11/26/23.
//

import SwiftUI

struct BalanceTrackerView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height:10)
                VStack(alignment: .leading, spacing: 20) {
                    Text("$999.99")
                        .font(.system(size: 36))
                        .bold()
                }
                
                List{
                    Section(header: Text("Recent Transactions")
                        .fontWeight(.semibold)) {
                        ForEach(transactions) { transaction in
                            HStack {
                                Image(.cube)
                                VStack(alignment: .leading) {
                                    Text(transaction.title)
                                        .font(.headline)
                                    Text(transaction.date, style: .date)
                                        .font(.subheadline)
                                }
                                
                                Spacer()
                                
                                Text(transaction.amount)
                                    .foregroundColor(transaction.amount.starts(with: "-") ? .green : .red)
                            }
                        }
                    }
                   
                }.tileBackground()
                    .listStyle(.plain)
                Spacer()
            }.navigationTitle("Balance Tracker")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let date: Date
    let amount: String
}

let transactions = [
    Transaction(title: "Shopping product", date: Date(), amount: "$54"),
    Transaction(title: "Maintenance", date: Date(), amount: "$100"),
    // Add more transactions...
]

// Define a custom ViewModifier for the tile background
struct TileBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 354, height: 374)
            .background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.4), radius: 6, x: 0, y: 0)

    }
}

// Extension to easily apply the tile background to a view
extension View {
    func tileBackground() -> some View {
        self.modifier(TileBackgroundModifier())
    }
}

struct BalanceTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceTrackerView()
    }
}

#Preview {
    BalanceTrackerView()
}
