//
//  UserGitReposView.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit

class UserGitReposView: UIViewController {
    
    //Outlets
    @IBOutlet weak var reposTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    //Variables
    var viewModel: UserGitRepos!
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.viewDidLoad()
        bind()
    }
    
    //MARK: - Binding
    private func bind() {
        self.viewModel.gitRepos.observe(on: self) { [weak self] _ in
            DispatchQueue.main.async {
                self?.reposTableView.reloadData()
                self?.reposTableView.layoutIfNeeded()
            }
        }
    }
    
    //MARK: - Setup TableView
    private func setupTableView() {
        self.reposTableView.delegate = self
        self.reposTableView.dataSource = self
        self.reposTableView.register(UINib(nibName: "UserGitRepoCell", bundle: nil), forCellReuseIdentifier: "UserGitRepoCell")
    }
    
    //MARK: - Back Button
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
