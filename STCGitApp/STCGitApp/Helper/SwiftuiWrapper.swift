//
//  SwiftuiWrapper.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import SwiftUI

struct UIKitViewControllerWrapper: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UserGitReposView, context: Context) {
        
    }
    
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func makeUIViewController(context: Context) -> UserGitReposView {
        let useCases = DefaultUserGitReposUseCases()
        let viewModel = UserGitReposViewModel(userGitReposUseCases: useCases, seletedUser: user)
        let vc = UserGitReposView()
        vc.viewModel = viewModel
        return vc
    }
}
