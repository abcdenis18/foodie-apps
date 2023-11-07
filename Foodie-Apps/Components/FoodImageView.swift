//
//  FoodImageView.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 07/11/23.
//

import SwiftUI

struct FoodImageView: View {
    
    @StateObject var imageLoader = ImageLoader()
    let imageURL: String
    
    var body: some View {
        NetworkImageView(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: imageURL)
            }
    }
    
}

#Preview {
    FoodImageView(imageURL: "")
}
