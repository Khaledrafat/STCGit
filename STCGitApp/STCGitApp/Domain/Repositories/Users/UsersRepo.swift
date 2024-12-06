//
//  UsersRepo.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import Foundation

//MARK: - Users Repo Protocol
protocol UsersRepo {
    func fetchUsers(
        completion: @escaping (Result<Users, Error>) -> Void
    )
}
