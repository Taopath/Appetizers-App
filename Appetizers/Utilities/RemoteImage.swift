//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Nikita Alexander on 06/06/2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func loadImage(from urlString: String) {
        Task {
            guard let uiImage = try await NetworkManager.shared.downloadImage(from: urlString) else {return}
            self.image = Image(uiImage: uiImage)
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.loadImage(from: urlString)
            }
    }
}
