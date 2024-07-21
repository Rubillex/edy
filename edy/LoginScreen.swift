//
//  Login.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

import SwiftUI

struct Login: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    @State private var phoneNumber: String = ""
    
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
            
            VStack {
                Spacer()
                
                VStack(spacing: 32) {
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 350)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Авторизация")
                            .font(.system(size: 32))
                            .foregroundColor(Color("Colors/PrimaryText"))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Введите номер телефона, на который будет отправлен код для входа в приложение")
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14))
                            .foregroundColor(Color("Colors/SecondaryText"))
                            .fontWeight(.medium)
                        
                        TextField(
                            "",
                            text: $phoneNumber,
                            prompt: Text("Телефон")
                                .foregroundColor(Color("Colors/PrimaryText"))
                        )
                        .onChange(of: phoneNumber) {
                            if !phoneNumber.isEmpty {
                                phoneNumber = phoneNumber.formatPhoneNumber()
                            }
                        }
                        .font(.system(size: 16))
                        .foregroundColor(Color("Colors/PrimaryText"))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color(Color("Colors/InputBorder")), lineWidth: 1)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                        )
                        .keyboardType(.phonePad)
                        
                        Button(action: {
                            loginViewModel.sendMessage(phoneNumber: phoneNumber)
                        }) {
                            Text("Отправить код")
                                .font(.system(size: 16))
                                .foregroundColor(Color(Color("Colors/PrimaryText")))
                        }
                        .buttonStyle(WhiteButtonStyle())
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(32)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(12)
                    .frame(maxWidth: 350)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct WhiteButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(Color("Colors/PrimaryText")))
            .frame(maxHeight: 52)
            .frame(maxHeight: 44)
            .padding(.horizontal, 16)
            .background(Color(Color("Colors/PrimaryBackground")))
            .opacity(configuration.isPressed ? 0.9 : 1)
            .cornerRadius(38)
            .overlay(
                RoundedRectangle(cornerRadius: 38)
                    .stroke(Color(Color("Colors/Alternative")), lineWidth: 1)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            )
    }
    
}


#Preview {
    Login()
}
