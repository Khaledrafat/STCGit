//
//  UserGitReposView+tableView.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit
import SwiftUI

extension UserGitReposView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.gitRepos.value.count
    }
    
    //MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserGitRepoCell", for: indexPath) as? UserGitRepoTableCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(repo: self.viewModel.gitRepos.value[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.viewModel.gitRepos.value[indexPath.row]
        let userRepo = DefaultForkedUserRepo()
        let useCases = DefaultForkedUsersUseCases(repo: userRepo)
        let vm = DefaultForkedUsersViewModel(userRepo: item, useCases: useCases)
        let vc = ForkedUsersViewController()
        vc.viewModel = vm
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
