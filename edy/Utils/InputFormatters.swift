//
//  InputFormatters.swift
//  edy
//
//  Created by Вадим Губченко on 19.07.2024.
//

import SwiftUI
import UIKit

// Кастомный UIViewRepresentable для TextField с маской
struct MaskedTextField: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    var mask: String
    var placeholderColor: UIColor

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        textField.keyboardType = .numberPad
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: MaskedTextField

        init(_ parent: MaskedTextField) {
            self.parent = parent
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let currentText = textField.text ?? ""
            let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
            let formattedText = applyMask(to: newText, mask: parent.mask)
            textField.text = formattedText
            parent.text = formattedText
            return false
        }

        private func applyMask(to text: String, mask: String) -> String {
            let cleanText = text.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            var result = ""
            var index = cleanText.startIndex

            for ch in mask {
                if index == cleanText.endIndex {
                    break
                }
                if ch == "#" {
                    result.append(cleanText[index])
                    index = cleanText.index(after: index)
                } else {
                    result.append(ch)
                }
            }
            return result
        }
    }
}
