//
//  ForkedUserRepoImpTests.swift
//  STCGitAppTests
//
//  Created by Khaled on 06/12/2024.
//

import XCTest
@testable import STCGitApp

class ForkedUserRepoImpTests: XCTestCase {
    
    //MARK: - fetch Sucess
    func test_fetchForkedUsersSuccess() {
        
        let mockNetworkService = MockNetworkService()
        let sut = DefaultForkedUserRepo(network: mockNetworkService)
        let expectedQuery = ForkedUsersQuery(ownerName: "owner", repoName: "repo")
        let expectedData = """
            [
                { "id": 1, "name": "User1" },
                { "id": 2, "name": "User2" }
            ]
            """.data(using: .utf8)!
        mockNetworkService.data = expectedData
        mockNetworkService.isSuccess = true
        
        let expectation = self.expectation(description: "FetchForkedUsersSuccess")
        
        sut.fetchForkedUsers(query: expectedQuery) { result in
            switch result {
            case .success(let forkedUsers):
                XCTAssertEqual(forkedUsers.count, 2)
                XCTAssertEqual(forkedUsers[0].name, "User1")
                XCTAssertEqual(forkedUsers[1].name, "User2")
            case .failure:
                XCTFail("Expected success, but got failure.")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
    
    //MARK: - Fetch Failed
    func test_fetchForkedUsersFailure() {
        let mockNetworkService = MockNetworkService()
        let sut = DefaultForkedUserRepo(network: mockNetworkService)
        let expectedQuery = ForkedUsersQuery(ownerName: "owner", repoName: "repo")
        
        mockNetworkService.error = .unexpectedError
        mockNetworkService.isSuccess = false
        
        let expectation = self.expectation(description: "FetchForkedUsersFailure")
        
        sut.fetchForkedUsers(query: expectedQuery) { result in
            switch result {
            case .success:
                XCTFail("Expected failure, but got success.")
            case .failure(let error):
                print("HERRRRRRE")
                print(error.localizedDescription)
                XCTAssertEqual(error.localizedDescription, NetworkError.unexpectedError.localizedDescription)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2)
    }
    
}
