//
//  GitReposImp.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

final class defaultGitRepos: GitReposRepo {
    
    private var network: NetworkService
    
    //MARK: - INIT
    init(network: NetworkService = DefaultNetworkService()) {
        self.network = network
    }
    
    //MARK: - Fetch Git Repos
    func fetchGitRepos(userName: String, completion: @escaping (Result<GitRepos, Error>) -> Void) {
        let url = "https://api.github.com/users/\(userName)/repos"
        let param = ["Authorization" : Constants().githubToken]
        let endpoint = DefaultRequestable(stringUrl: url, method: .get, headerParameters: param)
        network.request(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let repo = try JSONDecoder().decode(GitRepos.self, from: data)
                    completion(.success(repo))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
