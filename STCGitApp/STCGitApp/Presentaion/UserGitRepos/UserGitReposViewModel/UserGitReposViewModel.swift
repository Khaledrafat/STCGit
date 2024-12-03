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
}

protocol UserGitRepos: UserGitReposInput, UserGitReposOutput {
    
}

//MARK: - UserGitReposViewModel
final class UserGitReposViewModel {
    
    private let userGitReposUseCases: UserGitReposUseCases
    private let selectedUser: User
    
    var gitRepos: Observable<GitRepos> = Observable([])
    
    //MARK: - INIT
    init(userGitReposUseCases: UserGitReposUseCases, seletedUser: User) {
        self.userGitReposUseCases = userGitReposUseCases
        self.selectedUser = seletedUser
    }
}

extension UserGitReposViewModel: UserGitRepos {
    
    //MARK: - viewdidload
    func viewDidLoad() {
        self.userGitReposUseCases.fetchUserRepos(userName: self.selectedUser.login.defaultValue) { result in
            switch result {
            case .success(let repos):
                DispatchQueue.main.async {[weak self] in
                    guard let self = self else { return }
                    self.gitRepos.value = repos
                }
            case .failure(let error):
                print("Error")
                print(error.localizedDescription)
            }
        }
    }
}
