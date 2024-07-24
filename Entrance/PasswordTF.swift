//
//  PasswordTF.swift
//  Entrance
//
//  Created by Vlad on 24/7/24.
//

import SwiftUI

struct PasswordTF: View {
    // MARK: - Properties
    var title: String
    @Binding var text: String
    @FocusState var isActive
    @State var showPassword = false
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            SecureField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 0 : 1)
            
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 16))
                .opacity(showPassword ? 1 : 0)
            
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .animation(.spring, value: isActive)
                .foregroundStyle(isActive ? .white : .secondary)
                .onTapGesture {
                    isActive = true
                }
        }
            .overlay(alignment: .trailing) {
                Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                    .padding(16)
                    .contentShape(Rectangle())
                    .foregroundStyle(showPassword ? .primary : .secondary)
                    .onTapGesture {
                        showPassword.toggle()
                    }
            }
    }
}

#Preview {
    HomeView(email: .constant(""), password: .constant(""), remember: .constant(false), showSignUp: .constant(false))
}
