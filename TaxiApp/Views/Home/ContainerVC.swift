//
//  ContainerVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 20/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    // MARK: - Propetis
    
    var menuVC: UIViewController!
    var centerVC: UIViewController!
    var isExpanded = false
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = " "
        navigationController?.navigationBar.isHidden = true
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    // MARK: - Handlers
    
    func configureHomeVC() {
        let homeVC = HomeVC()
        homeVC.delegate = self
        centerVC = UINavigationController(rootViewController: homeVC)
        
        view.addSubview(centerVC.view)
        addChild(centerVC)
        centerVC.didMove(toParent: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    func configureMenuVC() {
        if menuVC == nil {
            menuVC = MenuVC()
            view.insertSubview(menuVC.view, at: 0)
            addChild(menuVC)
            menuVC.didMove(toParent: self)
        }
    }
    
    func showMenuVC(shouldExpand: Bool) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerVC.view.frame.origin.x = self.centerVC.view.frame.width - 80
                //                if let home = self.centerVC.children.first {
                //                    home.view.backgroundColor = .black
                //                    home.view.alpha = 0.5
                //                }
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerVC.view.frame.origin.x = 0
                self.setNeedsStatusBarAppearanceUpdate()
                //                if let home = self.centerVC.children.first {
                //                    home.view.backgroundColor = .black
                //                    home.view.alpha = 1
                //                }
            }, completion: nil)
        }
        
        animateStatusBar()
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerVC: HomeVCDelegate {
    func handleMenuToggle() {
        if !isExpanded {
            configureMenuVC()
        }
        isExpanded = !isExpanded
        showMenuVC(shouldExpand: isExpanded)
    }
}
