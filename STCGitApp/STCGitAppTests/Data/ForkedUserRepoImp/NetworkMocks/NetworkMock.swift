//
//  NetworkMock.swift
//  STCGitAppTests
//
//  Created by Khaled on 06/12/2024.
//

import Foundation
@testable import STCGitApp

final class MockNetworkService: NetworkService {
    
    var data: Data?
    var error: NetworkError?
    var isSuccess = true

    func request(endpoint: Requestable, completion: @escaping CompletionHandler) {
        if let data = data, isSuccess {
            completion(.success(data))
        } else {
            completion(.failure(.unexpectedError))
        }
    }
}
