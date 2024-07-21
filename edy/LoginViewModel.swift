//
//  LoginViewModel.swift
//  edy
//
//  Created by Вадим Губченко on 20.07.2024.
//

import SwiftUI

struct Response: Codable {
    let data: UserInfo
}

class LoginViewModel: ObservableObject {
    private let router: Router
    
    init(router: Router) {
        self.router = router
    }
    
    func sendMessage(phoneNumber: String) {
        let baseurl:String = Bundle.main.infoDictionary?["BASE_URL"] as! String
        guard let url = URL(string: "\(baseurl)/api/v1/auth/login")
        else { return }
        
        let cleanedPhone = phoneNumber.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let formattedPhone = "+" + cleanedPhone
        
        // Параметры тела запроса
        let parameters: [String: Any] = [
            "phone": formattedPhone,
        ]
        
        // Преобразование параметров в JSON данные
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("Не удалось преобразовать параметры в JSON")
            return
        }
        
        // Создание запроса
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { ( data, response, error) in
            
            if let error = error {
                print("Ошибка: \(error.localizedDescription)")
                return
            }
            
            // Проверяем наличие ответа
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Не удалось получить ответ")
                return
            }
            
            if let data = data {
                do {
                    let results = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        UserDefaultsWorker.shared.saveUserInfo(userInfo: results.data)
                    }
                }
                catch {
                    print(error)
                }
            }
            
            // Проверяем статус код
            switch httpResponse.statusCode {
            case 200:
                self.router.showVerifyScreen(phone: phoneNumber)
            case 400:
                print("Ошибка клиента (400)")
            case 401:
                print("Неавторизован (401)")
            case 403:
                print("Запрещено (403)")
            case 404:
                print("Не найдено (404)")
            case 500:
                print("Ошибка сервера (500)")
            default:
                print("Неизвестный статус код: \(httpResponse.statusCode)")
            }
        }
        .resume()
    }
}
