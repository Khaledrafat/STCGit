//
//  ForkedUsersViewModel.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

protocol ForkedUsersViewModelInput {
    func viewDidLoad()
}

protocol ForkedUsersViewModelOutput {
    var forkedUsers: Observable<ForkedUsers> { get }
}

protocol ForkedUsersViewModel: ForkedUsersViewModelInput, ForkedUsersViewModelOutput {
    
}

//MARK: - DefaultForkedUsersViewModel
final class DefaultForkedUsersViewModel {
    
    private let userRepo: GitRepo
    private let useCases: ForkedUsersUseCases
    
    var forkedUsers: Observable<ForkedUsers> = Observable([])
    
    //MARK: - INIT
    init(userRepo: GitRepo, useCases: ForkedUsersUseCases) {
        self.userRepo = userRepo
        self.useCases = useCases
    }
}

//MARK: - Implementation
extension DefaultForkedUsersViewModel: ForkedUsersViewModel {
    func viewDidLoad() {
        guard let name = userRepo.owner?.login, let repo = userRepo.name else { return }
        let query = ForkedUsersQuery(ownerName: name, repoName: repo)
        useCases.fetchForkedUsers(query: query) { result in
            switch result {
            case .success(let forked):
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.forkedUsers.value = forked
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
