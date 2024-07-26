//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Nikita Alexander on 10/06/2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

// Function applying the modifier
extension View {
    func standardButtonStyle() ->  some View {
        self.modifier(StandardButtonStyle())
    }
}
