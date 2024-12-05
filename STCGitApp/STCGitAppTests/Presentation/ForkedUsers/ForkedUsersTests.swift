//
//  ForkedUsersTests.swift
//  STCGitAppTests
//
//  Created by Khaled on 05/12/2024.
//

import XCTest
@testable import STCGitApp

class ForkedUsersTests: XCTestCase {
    
    class MockForkedUsersUseCases: ForkedUsersUseCases {
        
        var mockedUsers: ForkedUsers = []
        var shouldSucceed = true
        var error: Error = NetworkError.error(statusCode: 1, data: nil, message: "Error Happened")
        
        func fetchForkedUsers(query: ForkedUsersQuery, completion: @escaping (Result<ForkedUsers, Error>) -> Void) {
            if shouldSucceed {
                completion(.success(mockedUsers))
            } else {
                completion(.failure(error))
            }
        }
    }
    
    //MARK: - Fetching Failed
    func test_whenFetchingDataFails() {
        let mockUseCase = MockForkedUsersUseCases()
        mockUseCase.shouldSucceed = false
        let repo = GitRepo()
        let viewModel = DefaultForkedUsersViewModel(userRepo: repo, useCases: mockUseCase)
        
        let expectation = XCTestExpectation(description: "Error message shown on fetch failure")
        
        viewModel.showError.observe(on: self) { message in
            if message == mockUseCase.error.localizedDescription {
                expectation.fulfill()
            }
        }
        
        viewModel.viewDidLoad()
        
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.isLoading.value, false)
    }
    
    //MARK: - Fetching Succeeded
    func test_whenFetchingDataSucceeds() {
        let mockUseCase = MockForkedUsersUseCases()
        let forkedUsers = [ForkedUser(name: "Test 1"),
                           ForkedUser(name: "Test 2")]
        mockUseCase.shouldSucceed = true
        mockUseCase.mockedUsers = forkedUsers
        let repo = GitRepo()
        let viewModel = DefaultForkedUsersViewModel(userRepo: repo, useCases: mockUseCase)
        
        let expectation = XCTestExpectation(description: "Forked users fetched successfully")
        
        viewModel.forkedUsers.observe(on: self) { users in
            if users == forkedUsers {
                expectation.fulfill()
            }
        }
        
        viewModel.viewDidLoad()
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.isLoading.value, false)
    }
    
    //MARK: - Loading State
    func test_isLoadingState() {
        let mockUseCase = MockForkedUsersUseCases()
        let repo = GitRepo()
        let viewModel = DefaultForkedUsersViewModel(userRepo: repo, useCases: mockUseCase)
        
        let expectation = XCTestExpectation(description: "Loading state updated correctly")
        
        viewModel.isLoading.observe(on: self) { loading in
            if loading {
                expectation.fulfill()
            }
        }
        
        viewModel.viewDidLoad()
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(viewModel.isLoading.value, false)
    }

}
