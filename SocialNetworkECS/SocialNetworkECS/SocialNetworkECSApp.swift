//
//  SocialNetworkECSApp.swift
//  SocialNetworkECS
//
//  Created by Domenico Cafarelli on 11/01/23.
//

// swiftlint:disable all

import SwiftUI

@main
struct SocialNetworkECSApp: App {
    @StateObject var userViewModel = UsersViewModel()
    var body: some Scene {
        WindowGroup {
            ProfileView(user: userViewModel.userInformationStore.first!)
        }
    }
}
