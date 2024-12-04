//
//  ForkedUserCell.swift
//  STCGitApp
//
//  Created by Khaled on 04/12/2024.
//

import UIKit
import SwiftUI

class ForkedUserCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    
    private var hostingController: UIHostingController<ForkedUserSwiftUICell>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(forkedUser: ForkedUser?, width: CGFloat) {
        
        let cellView = ForkedUserSwiftUICell(
            name: (forkedUser?.name).defaultValue,
            desc: (forkedUser?.description).defaultValue,
            width: width
        )
        
        if let hostingController = hostingController {
            hostingController.rootView = cellView
        } else {
            let hostingController = UIHostingController(rootView: cellView)
            self.hostingController = hostingController

            if let view = hostingController.view {
                view.translatesAutoresizingMaskIntoConstraints = false
                view.frame = CGRect(
                    x: 0,
                    y: 0,
                    width: 100,
                    height: 100
                )
                view.center = contentView.center
                contentView.addSubview(view)
            }
        }
    }

}
