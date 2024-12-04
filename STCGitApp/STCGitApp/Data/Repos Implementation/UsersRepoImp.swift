//
//  UsersRepoImp.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import Foundation

//MARK: - Users Repo Class
final class DefaultUsersRepo: UsersRepo {
    
    private var network: NetworkService
    
    //MARK: - INIT
    init(network: NetworkService = DefaultNetworkService()) {
        self.network = network
    }
    
    //MARK: - Fetch Users
    func fetchUsers(completion: @escaping (Result<Users, Error>) -> Void) {
        let url = "https://api.github.com/users"
        let param = ["Authorization" : Constants().githubToken]
        //I didn't use pagination so the pagination's query is set here
        let query = ["page":"1", "per_page":"30"]
        
        let endpoint = DefaultRequestable(stringUrl: url, method: .get, headerParameters: param, queryParameters: query)
        network.request(endpoint: endpoint) { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode(Users.self, from: data)
                    completion(.success(users))
                } catch let error {
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
