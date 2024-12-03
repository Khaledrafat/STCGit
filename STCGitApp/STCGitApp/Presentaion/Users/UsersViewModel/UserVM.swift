//
//  UsersViewModel.swift
//  Github-App
//
//  Created by Khaled on 02/12/2024.
//

import Foundation

protocol UserViewModelInput {
    func viewdidload()
}

protocol UserViewModelOutput {
    
}

protocol UsersViewModel: UserViewModelInput, UserViewModelOutput { }

final class DefaultUsersViewModel: ObservableObject {
    private let usersUseCases: UsersUseCases
    @Published var items: Users = []
    
    //MARK: - INIT
    init(usersUseCases: UsersUseCases) {
        self.usersUseCases = usersUseCases
    }
}

//MARK: - Inputs
extension DefaultUsersViewModel: UsersViewModel {
    func viewdidload() {
        self.usersUseCases.fetchUsers {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.items = users
                    print(self.items)
                }
            case .failure(let error):
                print("HERE 2")
                print(error.localizedDescription)
            }
        }
    }
}
