//
//  FoodItemView.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 06/11/23.
//

import SwiftUI

struct FoodItemView: View {
    let food: Food
    
    var body: some View {
        HStack (spacing: 20) {
            
            Image("burger")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .cornerRadius(10)
            
            VStack (alignment: .leading ,spacing: 10) {
                Text("\(food.name)")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("\(food.description)")
                
                Text("$\(food.price, specifier: "%.2f")")
                    .foregroundColor(.appPrimary)
            }
            
        }
    }
}

#Preview {
    FoodItemView(food: MockData.mockFood)
}
