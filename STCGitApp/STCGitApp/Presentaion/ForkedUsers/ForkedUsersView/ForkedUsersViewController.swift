//
//  ForkedUsersViewController.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit

class ForkedUsersViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forkedUsersCollection: UICollectionView!
    
    //Variables
    var viewModel: ForkedUsersViewModel?
    var baseVCActions: BaseViewAction?

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreen()
        bind()
        viewModel?.viewDidLoad()
    }
    
    //MARK: - Setup Screen
    private func setupScreen() {
        if baseVCActions == nil {
            baseVCActions = DefaultBaseViewAction()
        }
        setupCollection()
    }
    
    //MARK: - Binding
    private func bind() {
        //Data
        self.viewModel?.forkedUsers.observe(on: self, observerBlock: {[weak self] _ in
            DispatchQueue.main.async {
                self?.forkedUsersCollection.reloadData()
            }
        })
        
        //Loader
        self.viewModel?.isLoading.observe(on: self) { [weak self] show in
            guard let self = self else { return }
            DispatchQueue.main.async {
                show ? self.baseVCActions?.showLoader(on: self) : self.baseVCActions?.hideLoader()
            }
        }
        
        //Error
        self.viewModel?.showError.observe(on: self) { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                guard !error.isEmpty else { return }
                self.baseVCActions?.showAlert(on: self, title: "Error", message: error, action: {
                    self.baseVCActions?.dismissAlert()
                } )
            }
        }
    }
    
    //MARK: - Setup Collection
    private func setupCollection() {
        forkedUsersCollection.dataSource = self
        forkedUsersCollection.delegate = self
        let nib = UINib(nibName: "ForkedUserCell", bundle: nil)
        forkedUsersCollection.register(nib, forCellWithReuseIdentifier: "ForkedUserCell")
    }
    
    //MARK: - Back Button
    @IBAction func backButtonAction(_ sender: UIButton) {
        guard let window = self.view.window else { return }
        window.rootViewController?.dismiss(animated: true)
    }
    
}
