//
//  OrderView.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        //process the order
                    } label: {
                        APButton(
                            title: "$\(order.totalPrice, specifier: "%.2f") - Place Order"
                        )
                    }
                    .padding()
                } 
                
                if order.items.isEmpty {
                    EmptyState(
                        imageName: "empty-order",
                        message: "You have no items in your order.\nPlease add an appetizer."
                    )
                }
            }
            .navigationTitle("Order")
            .toolbar(content: {
                if !order.items.isEmpty {
                    Button {
                        order.items.removeAll()
                    } label: {
                        Text("Clear Order")
                    }
                }
            })
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.delete(at: offsets)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
