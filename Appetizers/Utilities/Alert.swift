//
//  Alert.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    //MARK: - Networking Errors
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid URL, please try again later."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("Received invalid data from the server. Please try again later."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server. Please try again later."),
        dismissButton: .default(Text("OK"))
    )
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to load appetizers, please check your internet connection."),
        dismissButton: .default(Text("OK"))
    )
    
    //MARK: - Form Validation Errors
    static let invalidForm = AlertItem(
        title: Text("Invalid Form"),
        message: Text("Please ensure all fields in the form have been completed") ,
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please ensure the entered e-mail is of the correct format"),
        dismissButton: .default(Text("OK"))
    )
    
    static let userSaveSuccess = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Your profile changes have been successfully saved"),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidUserError = AlertItem(
        title: Text("Saving Error"),
        message: Text("There was an unexpected error saving or loading your profile"),
        dismissButton: .default(Text("OK"))
    )
    
}
