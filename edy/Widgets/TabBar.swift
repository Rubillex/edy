//
//  TabBar.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Int
    
    init(selectedTab: Binding<Int>) {
        self._selectedTab = selectedTab
    }
    
    var body: some View {
        HStack {
            ForEach((TabbarItems.allCases), id: \.self) { item in
                Button(action: {
                    selectedTab = item.rawValue
                }) {
                    CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                    if item != TabbarItems.allCases.last {
                        Spacer(minLength: 12)
                    }
                }
            }
        }
        .padding(.horizontal, 39)
        .padding(.vertical, 11)
        .background(Color("Colors/BlueDark"))
    }
}
