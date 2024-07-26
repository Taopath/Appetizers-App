//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Nikita Alexander on 05/06/2024.
//

import Foundation
import SwiftUI

//Our error enum
enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}

final class NetworkManager {
    
    static let shared: NetworkManager = NetworkManager()
    static let baseURL = "https://vector-media.co.uk/sapi/"
    private let appetizerURL = baseURL + "appetizers/assets.json"
    private let cache = NSCache<NSString, UIImage>()
    
    private init(){
        URLCache.shared.memoryCapacity = 100_000_000
        URLCache.shared.diskCapacity =  1000_000_000
    }
    
    // Asynchronous call to get appetizers
    func getAppetizers() async throws -> [Appetizer] {
        
        guard let url = URL(string: appetizerURL) else {throw APError.invalidURL}
        
        var data: Data?
        var response: URLResponse?
        
        do {
            let results = try await URLSession.shared.data(from: url)
            data = results.0
            response = results.1
        } catch {
            throw APError.unableToComplete
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("STATUS CODE:", (response as? HTTPURLResponse)?.statusCode ?? "BLANK")
            throw APError.invalidResponse
        }
        
        guard let data = data else {
            throw APError.invalidData
        }
        
        do {
            let decoder = JSONDecoder()
            let results = try decoder.decode(AppetizerResponse.self, from: data)
            return results.request
        } catch {
            print("Decoding went wrong - check for coding mistakes")
            throw APError.invalidData
        }
    }
    
    // Async function for downloading images with manual caching
    func downloadImage(from urlString: String) async throws -> UIImage? {
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: urlString) else {return nil}
        let imageData = try await URLSession.shared.data(from: url)
        let image = UIImage(data: imageData.0)
        
        if let image = image {cache.setObject(image, forKey: cacheKey)}
        
        return image
    }
    
    // Call with completion to get appetizers for backward compatibility
    func getAppetizersWithCompletion(completion: @escaping(Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: appetizerURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completion(.success(decodedResponse.request))
            } catch {
                print("Decoding went wrong - check for coding mistakes")
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
