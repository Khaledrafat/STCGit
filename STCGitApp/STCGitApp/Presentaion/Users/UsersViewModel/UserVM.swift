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
    var items: Users { get }
    var isLoading: Bool { get }
    var showError: Bool { get set }
    var errorMessage: String { get }
}

protocol UsersViewModel: UserViewModelInput, UserViewModelOutput, ObservableObject { }

//MARK: - Default Users View Model
final class DefaultUsersViewModel {
    private let usersUseCases: UsersUseCases
    @Published var items: Users = []
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    var errorMessage: String = ""
    
    //MARK: - INIT
    init(usersUseCases: UsersUseCases) {
        self.usersUseCases = usersUseCases
    }
}

//MARK: - Implementation
extension DefaultUsersViewModel: UsersViewModel {
    func viewdidload() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        self.usersUseCases.fetchUsers { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.isLoading = false
            }
            switch result {
            case .success(let users):
                DispatchQueue.main.async {
                    self.items = users
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.showError = true
                }
            }
        }
    }
}
