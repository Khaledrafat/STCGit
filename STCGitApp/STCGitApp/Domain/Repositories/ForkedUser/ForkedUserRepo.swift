//
//  ForkedUserRepo.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

protocol ForkedUserRepo {
    func fetchForkedUsers(
        query: ForkedUsersQuery,
        completion: @escaping (Result<ForkedUsers, Error>) -> Void
    )
}
