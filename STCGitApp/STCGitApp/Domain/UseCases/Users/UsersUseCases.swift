//
//  UsersUseCases.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import Foundation

//MARK: - UsersUseCases
protocol UsersUseCases {
    func fetchUsers(
        completion: @escaping (Result<Users, Error>) -> Void
    )
}

//MARK: - DefaultUsersUseCases
final class DefaultUsersUseCases: UsersUseCases {
    private let usersRepo: UsersRepo
    
    //MARK: - INIT
    init(usersRepo: UsersRepo) {
        self.usersRepo = usersRepo
    }
    
    //MARK: - Fetch Users
    func fetchUsers(completion: @escaping (Result<Users, Error>) -> Void) {
        self.usersRepo.fetchUsers(completion: completion)
    }
}
