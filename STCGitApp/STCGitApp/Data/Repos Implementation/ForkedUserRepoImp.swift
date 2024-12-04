//
//  ForkedUserRepoImp.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

final class DefaultForkedUserRepo: ForkedUserRepo {
    
    private var network: NetworkService
    
    //MARK: - INIT
    init(network: NetworkService = DefaultNetworkService()) {
        self.network = network
    }
    
    //MARK: - Fetch Forked Users
    func fetchForkedUsers(query: ForkedUsersQuery, completion: @escaping (Result<ForkedUsers, Error>) -> Void) {
        let url = "https://api.github.com/repos/\(query.ownerName)/\(query.repoName)/forks"
        let param = ["Authorization" : Constants().githubToken]
        let endpoint = DefaultRequestable(stringUrl: url, method: .get, headerParameters: param)
        network.request(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let forkedUsers = try JSONDecoder().decode(ForkedUsers.self, from: data)
                    completion(.success(forkedUsers))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
