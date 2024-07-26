//
//  APButton.swift
//  Appetizers
//
//  Created by Nikita Alexander on 06/06/2024.
//

import SwiftUI

struct APButton: View {
    
    var title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundColor(.white)
            .background(.brandPrimary)
            .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    APButton(title: "Add To Order")
}
