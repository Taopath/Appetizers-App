//
//  EmptyState.swift
//  Appetizers
//
//  Created by Nikita Alexander on 07/06/2024.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                Text(message)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -20)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "Your order is empty")
}
