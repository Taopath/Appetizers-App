//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Order()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
