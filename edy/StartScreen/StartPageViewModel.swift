//
//  StartPageViewModel.swift
//  edy
//
//  Created by Вадим Губченко on 21.07.2024.
//

import Foundation

class StartPageViewModel: ObservableObject {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func showLoginScreen() {
        self.router.showLoginScreen()
    }
}
