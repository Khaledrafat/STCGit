//
//  GitRepos.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

protocol GitReposRepo {
    func fetchGitRepos(
        userName: String,
        completion: @escaping (Result<GitRepos, Error>) -> Void
    )
}
