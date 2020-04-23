//
//  SignInVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 15/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    @IBOutlet weak var inputName: CustomTextField!
    @IBOutlet weak var inputPassword: CustomTextField!
    @IBOutlet weak var buttonSignIn: CustomButton!
    private var showPassword = false

    override func viewDidLoad() {
        super.viewDidLoad()
        inputName.delegate = self
        inputPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationDetail()
        inputPassword.addRightImageTextField(andImage: Asset.icEye.image, hasTapGesture: UITapGestureRecognizer(target: self, action: #selector(handleTapShowOrHidePassword)))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationItem.title = " "
    }
    
    func setNavigationDetail() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Sign In"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

}

extension SignInVC: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == UIReturnKeyType.next {
            inputPassword.becomeFirstResponder()
        }
        
        if textField.returnKeyType == UIReturnKeyType.done {
            signIn()
        }
        
        return true
    }
    
    func signIn() {
        let home = ContainerVC()
        self.navigationController?.pushViewController(home, animated: true)
    }
}

extension SignInVC {
    @IBAction func actionSignUpTouch(_ sender: Any) {
        let signUp = SignUpVC()
        self.navigationController?.pushViewController(signUp, animated: true)
    }
    
    @IBAction func actionSignInTouch(_ sender: Any) {
        self.signIn()
//        buttonSignIn.layoutButton(.loading)
    }
    
    @objc func handleTapShowOrHidePassword(_ tap: UITapGestureRecognizer) {
        self.showPassword = !self.showPassword
        inputPassword.isSecureTextEntry = !self.showPassword
    }
}
