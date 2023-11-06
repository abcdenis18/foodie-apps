//
//  HomeScreen.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 06/11/23.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var foods: Foods = []
    
    var body: some View {
        NavigationView {
            List(foods, id: \.id) { food in
                FoodItemView(food: food)
            }
            .navigationTitle("Foodie")
        }
        .onAppear {
            fetchFoods()
        }
    }
    
    func fetchFoods() {
        NetworkManager.shared.getFoods { result in
        
            switch result {
            case .success(let foods):
                self.foods = foods
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
}

#Preview {
    HomeScreen()
}
