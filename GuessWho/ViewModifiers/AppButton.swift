//
//  AppButton.swift
//  GuessWho
//
//  Created by gary on 25/10/2020.
//

import SwiftUI

struct AppButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.appButtonText)
            .font(.appFont(size: 30))
            .padding()
            .background(Color.appButtonBackground)
            .cornerRadius(16)
    }
}
