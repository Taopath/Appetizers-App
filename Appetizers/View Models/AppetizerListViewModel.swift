//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import SwiftUI

@MainActor 
final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = true
    @Published var isShowingDetail: Bool = false
    @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        Task {
            do {
                self.appetizers = try await NetworkManager.shared.getAppetizers()
                self.isLoading = false
            } catch {
                if let error =  error as? APError {
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    //Handle custom error case 
                    self.alertItem = AlertItem(
                        title: Text("Network Error"),
                        message: Text(error.localizedDescription),
                        dismissButton: .default(Text("OK"))
                    )
                }
                self.isLoading = false
            }
        }
    }
}
