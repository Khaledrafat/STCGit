//
//  STCGitAppApp.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import SwiftUI

@main
struct STCGitAppApp: App {
    var body: some Scene {
        WindowGroup {
            UsersView(
                viewModel: DefaultUsersViewModel(
                    usersUseCases: DefaultUsersUseCases(
                        usersRepo: DefaultUsersRepo(
                            network: DefaultNetworkService()
                        )
                    )
                )
            )
        }
    }
}
