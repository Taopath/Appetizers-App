//
//  Appetizer.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import Foundation

struct Appetizer: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Codable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 1,
        name: "Buffalo Chicken Bites",
        description: "The tasty bites of chicken have just the right amount of kick to them.",
        price: 9.99,
        imageURL: "https://vector-media.co.uk/sapi/appetizers/images/buffalo-chicken-bites.jpg",
        calories: 350,
        protein: 50,
        carbs: 20
    )
    
    static let orderItem1 = Appetizer(
        id: 1,
        name: "Asian Flank Steak",
        description: "This perfectly thin cut just melts in your mouth.",
        price: 8.99,
        imageURL: "https://vector-media.co.uk/sapi/appetizers/images/asian-flank-steak.jpg",
        calories: 350,
        protein: 50,
        carbs: 20
    )
    
    static let orderItem2 = Appetizer(
        id: 2,
        name: "Buffalo Chicken Bites",
        description: "The tasty bites of chicken have just the right amount of kick to them.",
        price: 7.99,
        imageURL: "https://vector-media.co.uk/sapi/appetizers/images/buffalo-chicken-bites.jpg",
        calories: 350,
        protein: 50,
        carbs: 20
    )
    
    static let orderItem3 = Appetizer(
        id: 3,
        name: "Chicken Wings",
        description: "You'll need extra napkins with these tasty treats.",
        price: 11.49,
        imageURL: "https://vector-media.co.uk/sapi/appetizers/images/chicken-wings.jpg",
        calories: 350,
        protein: 50,
        carbs: 20
    )
    
    static let appetizers: [Appetizer] = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    static let orderItems: [Appetizer] = [orderItem1, orderItem2, orderItem3]
}
