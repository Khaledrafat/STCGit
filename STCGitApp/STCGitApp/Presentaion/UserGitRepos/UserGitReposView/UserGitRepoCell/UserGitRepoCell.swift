//
//  UserGitRepoCell.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit

protocol UserGitRepoTableCell: UITableViewCell {
    func setupCell(repo: GitRepo)
}

class UserGitRepoCell: UITableViewCell, UserGitRepoTableCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var licenseLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8
    }
    
    //MARK: - Setup Cell
    func setupCell(repo: GitRepo) {
        titleLbl.text = repo.name
        
        let license = (repo.license?.name).defaultValue
        licenseLbl.text = "License: \(license)"
        
        let desc = repo.description.defaultValue
        descLbl.text = desc
        
        setupUI(desc: desc, license: license)
    }
    
    //MARK: - SetupUI
    private func setupUI(desc: String, license: String) {
        licenseLbl.isHidden = license.isEmpty
        descLbl.isHidden = desc.isEmpty
    }
    
}
