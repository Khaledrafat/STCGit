//
//  UserGitReposViewModel.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import Foundation

//MARK: - Inputs
protocol UserGitReposInput {
    func viewDidLoad()
}

//MARK: - Outputs
protocol UserGitReposOutput {
    var gitRepos: Observable<GitRepos> { get }
    var isLoading: Observable<Bool> { get }
    var showError: Observable<String> { get }
}

protocol UserGitRepos: UserGitReposInput, UserGitReposOutput {
    
}

//MARK: - UserGitReposViewModel
final class UserGitReposViewModel {
    
    private let userGitReposUseCases: UserGitReposUseCases
    private let selectedUser: User
    
    var gitRepos: Observable<GitRepos> = Observable([])
    var isLoading: Observable<Bool> = Observable(false)
    var showError: Observable<String> = Observable("")
    
    //MARK: - INIT
    init(userGitReposUseCases: UserGitReposUseCases, seletedUser: User) {
        self.userGitReposUseCases = userGitReposUseCases
        self.selectedUser = seletedUser
    }
}

//MARK: - Implementation
extension UserGitReposViewModel: UserGitRepos {
    
    //MARK: - viewdidload
    func viewDidLoad() {
        self.isLoading.value = true
        
        self.userGitReposUseCases.fetchUserRepos(userName: self.selectedUser.login.defaultValue) { [weak self] result in
            guard let self = self else { return }
            self.isLoading.value = false
            
            switch result {
            case .success(let repos):
                self.gitRepos.value = repos
                
            case .failure(let error):
                self.showError.value = error.localizedDescription
            }
        }
    }
}
