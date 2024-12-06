//
//  ForkedUsersViewController+Collection.swift
//  STCGitApp
//
//  Created by Khaled on 03/12/2024.
//

import UIKit
import SwiftUI

extension ForkedUsersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModel?.forkedUsers.value.count).defaultValue
    }
    
    //MARK: - Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ForkedUserCell", for: indexPath) as? ForkedUserCell else { return UICollectionViewCell() }
        
        let item = viewModel?.forkedUsers.value[indexPath.row]
        cell.configure(forkedUser: item, width: collectionView.frame.size.width - 12)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 12, height: CGFloat(92))
    }
}
