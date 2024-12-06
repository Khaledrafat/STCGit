//
//  GitRepoUseCases.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

protocol UserGitReposUseCases {
    func fetchUserRepos(
        userName: String,
        completion: @escaping (Result<GitRepos, Error>) -> Void
    )
}

//MARK: - DefaultUserGitReposUseCases
final class DefaultUserGitReposUseCases: UserGitReposUseCases {
    private let gitRepos: GitReposRepo
    
    init(gitRepos: GitReposRepo) {
        self.gitRepos = gitRepos
    }
    
    func fetchUserRepos(userName: String, completion: @escaping (Result<GitRepos, Error>) -> Void) {
        gitRepos.fetchGitRepos(userName: userName, completion: completion)
    }
}
