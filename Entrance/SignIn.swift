//
//  ContentView.swift
//  Entrance
//
//  Created by Vlad on 23/7/24.
//

import SwiftUI

struct SignIn: View {
    
    // MARK: - Properties
    @FocusState var isActive
    @Binding var email: String
    @Binding var password: String
    @Binding var remember: Bool
    @Binding var showSignUp: Bool
    @State var showForgotView = false
    
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 45) {
            TopView(title: "Welcome Back", details: "Please sign up in to your account")
            InfoTf(title: "Email", text: $email)
            VStack(spacing: 24) {
                PasswordTF(title: "Password", text: $password)
                HStack {
                    Toggle(isOn: $remember, label: {
                        Text("Label")
                    })
                    .toggleStyle(RememberStyle())
                    
                    Spacer()
                    
                    Button {
                        showForgotView.toggle()
                    } label: {
                        Text("Forget password?")
                            .bold()
                            .font(.footnote)
                    }
                }
            }
            
            SignButton(title: "Sign In", action: {})
            
            OrView(title: "Or")
            
            HStack(spacing: 65) {
                signAccount(image: .appleimg, width: 32, height: 32, action: {})
                signAccount(image: .emailimg, width: 32, height: 32, action: {})
                signAccount(image: .googleimg, width: 32, height: 32, action: {})
            }
            
            Spacer()
            
            Button {
                withAnimation {
                    showSignUp.toggle()
                }
            } label: {
                Text("Don`t have an account? ***Sing Up***")
            }
            .tint(.primary)
        }
        .padding()
        .sheet(isPresented: $showForgotView, content: {
            ForgotView()
                .presentationDetents([.fraction(0.40)])
        })
    }
}

struct TopView: View {
    // MARK: - Properties
    var title: String
    var details: String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title).font(.title.bold())
            Text(details)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InfoTf: View {
    // MARK: - Properties
    var title: String
    @Binding var text: String
    @FocusState var isActive
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("", text: $text)
                .padding(.leading)
                .frame(maxWidth: .infinity)
                .frame(height: 55).focused($isActive)
                .background(.gray.opacity(0.3),in: .rect(cornerRadius: 16))
            Text(title).padding(.leading)
                .offset(y: (isActive || !text.isEmpty) ? -50 : 0)
                .animation(.spring, value: isActive)
                .foregroundStyle(isActive ? .white : .secondary)
                .onTapGesture {
                    isActive = true
                }
        }
    }
}

struct RememberStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .contentTransition(.symbolEffect)
                Text("Remember")
            }
        }
        .tint(.primary)
    }
}

struct SignButton: View {
    // MARK: - Properties
    var title: String
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Text(title).foregroundStyle(.background).font(.title2.bold())
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .background(.primary, in: .rect(cornerRadius: 16))
        }
        .tint(.primary)
    }
}

struct OrView: View {
    // MARK: - Properties
    var title: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
            Text(title)
            Rectangle()
                .frame(height: 1.5)
                .foregroundStyle(.gray.opacity(0.3))
        }
    }
}

struct signAccount: View {
    // MARK: - Properties
    var image: ImageResource
    var width: CGFloat
    var height: CGFloat
    var action: () -> ()
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Image(image).renderingMode(.template)
                .resizable().scaledToFill()
                .frame(width: width, height: height)
                .overlay {
                    RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 1.5)
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.gray.opacity(0.3))
                }
        }
        .tint(.primary)
    }
}

// MARK: - Preview
#Preview {
    HomeView(email: .constant(""), password: .constant(""), remember: .constant(true), showSignUp: .constant(false))
}
