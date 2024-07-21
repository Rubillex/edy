//
//  Router.swift
//  edy
//
//  Created by Вадим Губченко on 21.07.2024.
//

import Foundation

final class Router: ObservableObject {
    static let shared = Router()
    
    @Published var path = [Route]()
    
    func showLoginScreen() {
        path.append(.login)
    }
    
    func showVerifyScreen(phone: String) {
        path.append(.verify(phone: phone))
    }
//    
//    func showRegisterPage() {
//        path.append(.register)
//    }
//    
//    func showCategoriesPage() {
//        path.append(.categories)
//    }
    
    func backToRoot() {
        path.removeAll()
    }
    
    func back() {
        path.removeLast()
    }
}
