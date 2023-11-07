//
//  NetworkError.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 06/11/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unbaledComplete
}
