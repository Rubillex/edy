//
//  StringExtension.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

import Foundation

extension String {    
    func formatPhoneNumber() -> String {
        // Удаляем все символы, кроме цифр
        let cleanNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        // Если номер пустой или слишком короткий, возвращаем пустую строку
        guard cleanNumber.count > 0 else {
            return ""
        }

        // Удаляем префикс `+7` если он уже есть
        let numberWithoutPrefix = cleanNumber.hasPrefix("7") ? String(cleanNumber.dropFirst()) : cleanNumber

        // Маска для форматирования номера
        let mask = "+7 (XXX) XXX XX-XX"
        
        var result = ""
        var startIndex = numberWithoutPrefix.startIndex
        let endIndex = numberWithoutPrefix.endIndex

        // Пройдитесь по маске и примените форматирование
        for char in mask {
            if startIndex == endIndex {
                break
            }
            
            if char == "X" {
                result.append(numberWithoutPrefix[startIndex])
                startIndex = numberWithoutPrefix.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        
        return result
    }

}
