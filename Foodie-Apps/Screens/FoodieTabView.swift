//
//  ContentView.swift
//  Foodie-Apps
//
//  Created by Denis Fajar Sidik on 06/11/23.
//

import SwiftUI

struct FoodieTabView: View {
    var body: some View {
        TabView {
            HomeScreen().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            OrderScreen().tabItem {
                Image(systemName: "bag")
                Text("list")
            }
            
            AccountScreen().tabItem {
                Image(systemName: "person")
                Text("Account")
            }
        }
        .accentColor(Color.appPrimary)
    }
}

#Preview {
    FoodieTabView()
}
