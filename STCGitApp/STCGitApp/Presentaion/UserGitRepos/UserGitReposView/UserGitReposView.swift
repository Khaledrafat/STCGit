//
//  UserGitReposView.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit

class UserGitReposView: UIViewController {
    
    //Outlets
    @IBOutlet private weak var reposTableView: UITableView!
    @IBOutlet private weak var backButton: UIButton!
    
    //Variables
    var viewModel: UserGitRepos!
    var baseVCActions: BaseViewAction?
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        viewModel.viewDidLoad()
        bind()
    }
    
    //MARK: - Setup Screen
    private func setupScreen() {
        if baseVCActions == nil {
            baseVCActions = DefaultBaseViewAction()
        }
        setupTableView()
    }
    
    //MARK: - Binding
    private func bind() {
        //Data
        self.viewModel.gitRepos.observe(on: self) { [weak self] _ in
            DispatchQueue.main.async {
                self?.reposTableView.reloadData()
            }
        }
        
        //Loader
        self.viewModel.isLoading.observe(on: self) { [weak self] show in
            guard let self = self else { return }
            DispatchQueue.main.async {
                show ? self.baseVCActions?.showLoader(on: self) : self.baseVCActions?.hideLoader()
            }
        }
        
        //Error
        self.viewModel.showError.observe(on: self) { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard !error.isEmpty else { return }
                self.baseVCActions?.showAlert(on: self, title: "Error", message: error, action: {
                    self.baseVCActions?.dismissAlert()
                } )
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
