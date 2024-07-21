//
//  ContentView.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

import SwiftUI

struct StartPageScreen: View {
    @ObservedObject var viewModel: StartPageViewModel
    
    var body: some View {
        ZStack {
            Image("humans")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .overlay(
                    Color(Color("Colors/Accent"))
                        .opacity(0.7)
                )
                .offset(x: -40)
            
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 350)
            
            Button(action: {
                viewModel.showLoginScreen()
            }) {
                Text("Войти")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .fontWeight(.medium)
            }
            .buttonStyle(OrangeButtonStyle())
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .offset(y: -20)
        }
    }
}

struct OrangeButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 150)
            .foregroundColor(.white)
            .frame(maxHeight: 52)
            .background(Color(Color("Colors/Accent")))
            .opacity(configuration.isPressed ? 0.9 : 1)
            .cornerRadius(40)
            .shadow(radius: configuration.isPressed ? 2 : 5, y: configuration.isPressed ? 2 : 5)
    }
    
}

#Preview {
    StartPageScreen(viewModel: StartPageViewModel(router: Router.shared))
}
