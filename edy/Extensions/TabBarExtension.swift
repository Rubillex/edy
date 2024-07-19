//
//  TabBar.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

import SwiftUI

extension TabBar {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        VStack {
            Image(imageName)
                .foregroundColor(isActive ? Color("Colors/SeaDark") : Color("Colors/Light"))
            Text(title)
                .foregroundStyle(isActive ? Color("Colors/SeaDark") : Color("Colors/Light"))
                .multilineTextAlignment(.center)
                .font(Font.custom("Rubik", size: 12))
                .fontWeight(.medium)
        }
    }
}
