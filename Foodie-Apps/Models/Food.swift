//
//  Food.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 06/11/23.
//

import Foundation

struct Food: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let protein: Int
    let calories: Int
    let carbs: Int
}

typealias Foods = [Food]


struct FoodReponse: Decodable {
    let request: Foods
}

struct MockData {
    static let mockFood = Food(id: 0001, name: "Mock Food", description: "Mock Description", imageURL: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", price: 4.45, protein: 200, calories: 24, carbs: 300)
    
    static let mockListFood = [mockFood, mockFood, mockFood, mockFood, mockFood, mockFood]
}
