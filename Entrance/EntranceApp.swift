//
//  EntranceApp.swift
//  Entrance
//
//  Created by Vlad on 23/7/24.
//

import SwiftUI

@main
struct EntranceApp: App {
    var body: some Scene {
        WindowGroup {
            SignIn(email: .constant(""), password: .constant(""), remember: .constant(false), showSignUp: .constant(false), action: {})
        }
    }
}
