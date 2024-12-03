//
//  UserGitReposView+tableView.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit

extension UserGitReposView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.gitRepos.value.count
    }
    
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
}
