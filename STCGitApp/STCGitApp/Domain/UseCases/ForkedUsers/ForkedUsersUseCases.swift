//
//  ForkedUsersUseCases.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

protocol ForkedUsersUseCases {
    func fetchForkedUsers(
        query: ForkedUsersQuery,
        completion: @escaping (Result<ForkedUsers, Error>) -> Void
    )
}

//MARK: - DefaultForkedUsersUseCases
final class DefaultForkedUsersUseCases: ForkedUsersUseCases {
    
    private var repo: ForkedUserRepo
    
    init(repo: ForkedUserRepo) {
        self.repo = repo
    }
    
    func fetchForkedUsers(query: ForkedUsersQuery, completion: @escaping (Result<ForkedUsers, Error>) -> Void) {
        repo.fetchForkedUsers(query: query, completion: completion)
    }
}
