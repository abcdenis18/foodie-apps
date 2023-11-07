//
//  NetworkImageView.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 07/11/23.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    func load(fromURLString urlString: String) {
        
        NetworkManager.shared.downloadImage(fromURLString: urlString) { image in
            
            guard let image = image else { return }
             
            DispatchQueue.main.async {
                self.image = Image(uiImage: image)
            }
            
        }
    }
}

struct NetworkImageView: View {
    var image: Image?
    
    var body: some View {
        (image ?? Image("food-placeholder")).resizable()
    }
}
