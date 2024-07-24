//
//  SignUp.swift
//  Entrance
//
//  Created by Vlad on 23/7/24.
//

import SwiftUI

struct SignUp: View {
    // MARK: - Properties
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var remember: Bool
    @Binding var showSignIn: Bool
    @State var showForgotView = false
    
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 45) {
            TopView(title: "Welcome Back", details: "Please sign up in to your account")
            InfoTf(title: "Email", text: $email)
            PasswordCheckField()
            
            SignButton(title: "Sign Up", action: {})
            
            OrView(title: "Or")
            
            HStack(spacing: 65) {
                signAccount(image: .appleimg, width: 32, height: 32, action: {})
                signAccount(image: .emailimg, width: 32, height: 32, action: {})
                signAccount(image: .googleimg, width: 32, height: 32, action: {})
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    showSignIn.toggle()
                }
            } label: {
                Text("Already have an account ? ***Sing In***")
            }
            .tint(.primary)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SignUp(email: .constant(""), password: .constant(""), remember: .constant(false), showSignIn: .constant(false), action: {})
}
