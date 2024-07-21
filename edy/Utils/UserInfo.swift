//
//  UserData.swift
//  edy
//
//  Created by Вадим Губченко on 21.07.2024.
//

import Foundation

struct UserInfo: Codable {
    let model: String
    let access_token: String
    let refresh_token: String
    let access_token_expires_at: Int64
    let refresh_token_expires_at: Int64
    let user: User
}

struct User: Codable {
    let id: Int
    let name: String?
    let phone: String
}
