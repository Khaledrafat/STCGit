//
//  UserGitReposViewModel.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

protocol UserGitReposInput {
    func viewdidload()
}

protocol UserGitRepos: UserGitReposInput {
    
}

//MARK: - UserGitReposViewModel
final class UserGitReposViewModel {
    
    private let userGitReposUseCases: UserGitReposUseCases
    private let selectedUser: User
    
    init(userGitReposUseCases: UserGitReposUseCases, seletedUser: User) {
        self.userGitReposUseCases = userGitReposUseCases
        self.selectedUser = seletedUser
    }
}

extension UserGitReposViewModel: UserGitRepos {
    func viewdidload() {
        
    }
}
