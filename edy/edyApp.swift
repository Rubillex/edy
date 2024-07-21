//
//  edyApp.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

import SwiftUI

@main
struct edyApp: App {
    @ObservedObject var router = Router.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                StartPageScreen(viewModel: StartPageViewModel(router: Router.shared))
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .login:
                            LoginScreen(loginViewModel: LoginViewModel(router: Router.shared))
                        case .verify(let phoneNumber):
                            VerifyScreen(phoneNumber: phoneNumber)
                        }
                    }
            }
        }
    }
}
