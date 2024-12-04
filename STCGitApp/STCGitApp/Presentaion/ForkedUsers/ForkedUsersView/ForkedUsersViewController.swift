//
//  ForkedUsersViewController.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit

class ForkedUsersViewController: BaseViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forkedUsersCollection: UICollectionView!
    
    //Variables
    var viewModel: ForkedUsersViewModel?

    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        bind()
        viewModel?.viewDidLoad()
    }
    
    //MARK: - Binding
    private func bind() {
        self.viewModel?.forkedUsers.observe(on: self, observerBlock: {[weak self] _ in
            DispatchQueue.main.async {
                self?.forkedUsersCollection.reloadData()
            }
        })
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
