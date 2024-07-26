//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import SwiftUI

struct AppetizerListCell: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.resizable()
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .clipShape(.rect(cornerRadius: 8))
            
            VStack (alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
