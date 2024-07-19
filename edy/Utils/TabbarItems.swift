//
//  TabbarItems.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

enum TabbarItems: Int, CaseIterable {
    case catalog = 0
    case home
    case contacts
    
    var title: String {
        switch self {
        case .catalog:
            return "Техника"
        case .home:
            return "Главная"
        case .contacts:
            return "Контакты"
        }
    }
    
    var iconName: String {
        switch self {
        case .catalog:
            return "TabBar/Catalog"
        case .home:
            return "TabBar/Home"
        case .contacts:
            return "TabBar/Contacts"
        }
    }
}
