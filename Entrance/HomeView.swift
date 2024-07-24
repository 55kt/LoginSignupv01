//
//  HomeView.swift
//  Entrance
//
//  Created by Vlad on 23/7/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @Binding var email: String
    @Binding var password: String
    @Binding var remember: Bool
    @Binding var showSignUp: Bool
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if showSignUp {
                SignUp(email: $email, password: $password, remember: $remember,
                       showSignIn: $showSignUp, action: {})
                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing)))
            } else {
                SignIn(email: $email, password: $password, remember: $remember,
                       showSignUp: $showSignUp, action: {})
                .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .leading)))
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    HomeView(email: .constant(""), password: .constant(""), remember: .constant(true), showSignUp: .constant(true))
}
