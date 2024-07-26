//
//  ModalDismissButton.swift
//  Appetizers
//
//  Created by Nikita Alexander on 06/06/2024.
//

import SwiftUI

struct ModalDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    ModalDismissButton()
}
