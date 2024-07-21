//
//  UserDefaultsWorker.swift
//  edy
//
//  Created by Вадим Губченко on 21.07.2024.
//

import Foundation

class UserDefaultsWorker {
    static let shared = UserDefaultsWorker()
    
    private static let KEY_ACCESS_TOKEN = "access_token"
    private static let KEY_ACCESS_TOKEN_EXPIRE = "access_token_expires_at"
    private static let KEY_REFRESH_TOKEN = "refresh_token"
    private static let KEY_REFRESH_TOKEN_EXPIRE = "refresh_token_expires_at"
    private static let KEY_USER_ID = "user_id"
    private static let KEY_USER_NAME = "user_name"
    private static let KEY_USER_PHONE = "user_phone"
    
    func saveUserInfo(userInfo: UserInfo) {
        let defaults = UserDefaults.standard
        defaults.set(userInfo.access_token, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        defaults.set(userInfo.access_token_expires_at, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_EXPIRE)
        defaults.set(userInfo.refresh_token, forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN)
        defaults.set(userInfo.refresh_token_expires_at, forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN_EXPIRE)
        defaults.set(userInfo.user.id, forKey: UserDefaultsWorker.KEY_USER_ID)
        defaults.set(userInfo.user.name, forKey: UserDefaultsWorker.KEY_USER_NAME)
        defaults.set(userInfo.user.phone, forKey: UserDefaultsWorker.KEY_USER_PHONE)
    }
    
    func getUserData() -> User {
        let defaults = UserDefaults.standard
        let id = defaults.object(forKey: UserDefaultsWorker.KEY_USER_ID) as? Int ?? 0
        let name = defaults.object(forKey: UserDefaultsWorker.KEY_USER_NAME) as? String ?? ""
        let phone = defaults.object(forKey: UserDefaultsWorker.KEY_USER_PHONE) as? String ?? ""
        
        return User(
            id: id,
            name: name,
            phone: phone
        )
    }
    
    func getAccessToken() -> TokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN) as? String ?? ""
        let expiresAt = defaults.object(forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_EXPIRE) as? Int64 ?? 0
        
        return TokenInfo(token: token, expiresAt: expiresAt)
    }
    
    func getRefreshToken() -> TokenInfo {
        let defaults = UserDefaults.standard
        let token = defaults.object(forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN) as? String ?? ""
        let expiresAt = defaults.object(forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN_EXPIRE) as? Int64 ?? 0
        
        return TokenInfo(token: token, expiresAt: expiresAt)
        
    }
    
    func haveAuthTokens() -> Bool {
        return !getAccessToken().token.isEmpty && !getRefreshToken().token.isEmpty
    }
    
    func dropTokens() {
        let defaults = UserDefaults.standard
        defaults.set("", forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN)
        defaults.set(0 as Int64, forKey: UserDefaultsWorker.KEY_ACCESS_TOKEN_EXPIRE)
        defaults.set("", forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN)
        defaults.set(0 as Int64, forKey: UserDefaultsWorker.KEY_REFRESH_TOKEN_EXPIRE)
    }
}
