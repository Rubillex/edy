//
//  VerifyScreen.swift
//  edy
//
//  Created by Вадим Губченко on 21.07.2024.
//

import SwiftUI

struct VerifyScreen: View {
    @State var phoneNumber = ""
    
    var body: some View {
        HStack {
            Text("\(phoneNumber)")
            Text("\(UserDefaultsWorker.shared.getAccessToken().token)")
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    VerifyScreen()
}
