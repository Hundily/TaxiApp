//
//  SplashVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 15/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true

        setAnimation()
    }
    
    func setAnimation() {
        UIView.animate(withDuration: 0.2) {
            let signInVC = UINavigationController(rootViewController: SignInVC())
            signInVC.modalPresentationStyle = .fullScreen
            self.navigationController?.present(signInVC, animated: true, completion: nil)
        }
    }
}
