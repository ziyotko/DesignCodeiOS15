//
//  Tab.swift
//  DesignCodeiOS15
//
//  Created by 支天白 on 2022/6/24.
//

import SwiftUI

struct TabItem:Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Learn Now", icon: "house" ,tab: .home,color: .teal),
    TabItem(text: "Explore", icon: "magnifyingglass" ,tab: .explore,color: .blue),
    TabItem(text: "Notifications", icon: "bell" ,tab: .notifications,color: .red),
    TabItem(text: "Library", icon: "rectangle.stack" ,tab: .library,color: .pink),
]

enum Tab: String {
    case home
    case explore
    case notifications
    case library
}

struct TabPreferenceKey : PreferenceKey {
    static var defaultValue : CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue nexValue: () -> CGFloat){
        value = nexValue()
    }
    
}
