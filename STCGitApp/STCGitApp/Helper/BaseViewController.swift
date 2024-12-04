//
//  BaseViewController.swift
//  STCGitApp
//
//  Created by Khaled on 04/12/2024.
//

import UIKit
import SwiftUI

protocol BaseViewAction {
    func showLoader(on parent: UIViewController)
    func hideLoader()
}

class DefaultBaseViewAction: BaseViewAction {
    
    private var hostingController: UIHostingController<Loader>?
    
    //MARK: - Show Loader
    func showLoader(on parent: UIViewController) {
        let loader = Loader()
        let hostingController = UIHostingController(rootView: loader)
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        parent.addChild(hostingController)
        parent.view.addSubview(hostingController.view)
        
        NSLayoutConstraint.activate([
            hostingController.view.centerXAnchor.constraint(equalTo: parent.view.centerXAnchor),
            hostingController.view.centerYAnchor.constraint(equalTo: parent.view.centerYAnchor),
            hostingController.view.widthAnchor.constraint(equalToConstant: 150),
            hostingController.view.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        hostingController.didMove(toParent: parent)
        self.hostingController = hostingController
    }
    
    //MARK: - Hide Loader
    func hideLoader() {
        hostingController?.willMove(toParent: nil)
        hostingController?.view.removeFromSuperview()
        hostingController?.removeFromParent()
        hostingController = nil
    }
    
}
