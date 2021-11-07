//
//  ImageLoader.swift
//  FoodZap
//
//  Created by KANISHK VIJAYWARGIYA on 30/10/21.
//

import SwiftUI
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    func fetch(for urlString: String) {
        guard image == nil && !isLoading else {
            return
        }
        guard let fetchUrl = URL(string: urlString) else {
            errorMessage = "Bad url request"
            return
        }
        isLoading = true
        errorMessage = nil
        
        let request = URLRequest(url: fetchUrl, cachePolicy: .returnCacheDataElseLoad)
        
        let task = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                    self?.errorMessage = "Bad URL Request"
                } else if let data = data, let image = UIImage(data: data) {
                    self?.image = image
                } else {
                    self?.errorMessage = "Unknown API error"
                }
            }
        }
        task.resume()
    }
    
}
