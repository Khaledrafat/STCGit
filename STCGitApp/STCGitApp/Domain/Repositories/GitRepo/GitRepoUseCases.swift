//
//  GitRepoUseCases.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

protocol UserGitReposUseCases {
    func fetchUserRepos(userName: String)
}

final class DefaultUserGitReposUseCases: UserGitReposUseCases {
    func fetchUserRepos(userName: String) {
        
    }
}
