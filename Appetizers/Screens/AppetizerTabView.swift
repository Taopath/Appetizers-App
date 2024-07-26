//
//  ContentView.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppetizerTabView()
        .environmentObject(Order())
}
