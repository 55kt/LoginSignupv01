//
//  ForgotView.swift
//  Entrance
//
//  Created by Vlad on 24/7/24.
//

import SwiftUI

struct ForgotView: View {
    @State var email = ""
    
    var body: some View {
        VStack(spacing: 28) {
            VStack(spacing: 8) {
                Text("Forgot your password?").font(.title.bold())
                Text("Enter your email address and we will share a link to create a new password")
                    .fixedSize(horizontal: false, vertical: true)
                    .foregroundStyle(.secondary)
            }
            InfoTf(title: "Email", text: $email)
                .padding(.top, 22)
            .multilineTextAlignment(.center)
            SignButton(title: "Send", action: {})
            Spacer()
        }
        .padding()
        .padding(.top, 20)
    }
}

#Preview {
    ForgotView()
}
