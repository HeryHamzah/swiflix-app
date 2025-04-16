//
//  RemoteImage.swift
//  swiflix
//
//  Created by MD-HeryHamzah on 13/01/24.
//

import UIKit
import SwiftUI

func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
    let cache = NSCache<NSString, UIImage>()
    
    let cacheKey = NSString(string: urlString)
    
    if let image = cache.object(forKey: cacheKey) {
        completed(image)
        return
    }
    
    guard let url = URL(string: urlString) else {
        completed(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
        
        guard let data, let image = UIImage(data: data) else {
            completed(nil)
            return
        }
        
        cache.setObject(image, forKey: cacheKey)
        completed(image)
        
    }
    
    task.resume()
    
}


@Observable final class ImageLoader {
    
    var image: Image?
    var isLoading: Bool = false
    
    func load(fromURLString urlString: String) {
        isLoading = true
        
        downloadImage(fromURLString: urlString) { [weak self] uiImage in
            
            guard let uiImage else {
                self?.isLoading = false
                return
            }
            
            DispatchQueue.main.async {
                self?.isLoading = false
                self?.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct SwiflixRemoteImage<Content: View>: View {
    
    @State var imageLoader = ImageLoader()
    var urlString: String
    
    let content: (Image) -> Content
    let placeholder: () -> Color
    
    init(urlString: String, @ViewBuilder content: @escaping (Image) -> Content, @ViewBuilder placeholder: @escaping () -> Color) {
        self.urlString = urlString
        self.content = content
        self.placeholder = placeholder
    }
    
    var body: some View {
        
        Group {
            if let image = imageLoader.image {
                content(image)
            } else {
                placeholder()
            }
        }
        .onAppear {
            imageLoader.load(fromURLString: urlString)
        }
    }
}
