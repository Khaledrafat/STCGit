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
    var isLoading: Observable<Bool> { get }
}

protocol ForkedUsersViewModel: ForkedUsersViewModelInput, ForkedUsersViewModelOutput { }

//MARK: - DefaultForkedUsersViewModel
final class DefaultForkedUsersViewModel {
    
    private let userRepo: GitRepo
    private let useCases: ForkedUsersUseCases
    
    var forkedUsers: Observable<ForkedUsers> = Observable([])
    var isLoading: Observable<Bool> = Observable(false)
    
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
        self.isLoading.value = true
        useCases.fetchForkedUsers(query: query) { [weak self] result in
            guard let self = self else { return }
            self.isLoading.value = false
            switch result {
            case .success(let forked):
                self.forkedUsers.value = forked
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
