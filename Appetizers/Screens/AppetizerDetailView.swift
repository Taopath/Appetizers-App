//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Nikita Alexander on 06/06/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .ignoresSafeArea()
                .contentShape(Rectangle())
                .onTapGesture {
                    isShowingDetail = false
                }
            VStack {
                AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image("food-placeholder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame(width: 300, height: 225)
                VStack {
                    Text(appetizer.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 16)
                    
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                    HStack(spacing: 40) {
                        NutritionInfo(title: "Calories", value: appetizer.calories, isGramUnits: false)
                        NutritionInfo(title: "Carbs", value: appetizer.carbs, isGramUnits: true)
                        NutritionInfo(title: "Protein", value: appetizer.protein, isGramUnits: true)
                    }
                }
                
                Spacer()
                
                Button {
                    order.add(appetizer)
                    isShowingDetail = false
                } label: {
                    APButton(
                        title: "$\(appetizer.price, specifier: "%.2f") - Add To Order"
                    )
                }
                .padding()
            }
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: 12))
            .shadow(radius: 40)
            .overlay(alignment: .topTrailing) {
                Button {
                    isShowingDetail = false
                } label: {
                    ModalDismissButton()
                }
            }
        }
    }
}

struct NutritionInfo: View {
    
    var title: String
    var value: Int
    var isGramUnits: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            
            Text("\(value)" + (isGramUnits ? "g" : ""))
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(
        appetizer: MockData.sampleAppetizer,
        isShowingDetail: .constant(false)
    )
}
