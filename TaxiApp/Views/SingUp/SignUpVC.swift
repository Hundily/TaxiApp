//
//  SignUpVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 15/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet weak var inputName: CustomTextField!
    @IBOutlet weak var inputEmail: CustomTextField!
    @IBOutlet weak var inputPassword: CustomTextField!
    private var showPassword = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputName.delegate = self
        inputEmail.delegate = self
        inputPassword.delegate = self
        inputPassword.addRightImageTextField(andImage: Asset.icEye.image, hasTapGesture: UITapGestureRecognizer(target: self, action: #selector(handleTapShowOrHidePassword)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationLayout()        
    }
    
    private func setupNavigationLayout() {
        navigationItem.title = "Sign Up"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.isHidden = false
    }
    
    private func signUp() {
        let home = ContainerVC()
        navigationController?.pushViewController(home, animated: true)
    }
}

extension SignUpVC: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.returnKeyType == UIReturnKeyType.next {
            if textField == inputName {
                inputEmail.becomeFirstResponder()
            }
            
            if textField == inputEmail {
                inputPassword.becomeFirstResponder()
            }
        }
        
        if textField.returnKeyType == UIReturnKeyType.done {
            signUp()
        }
        
        return false
    }
}

extension SignUpVC {
    
    @IBAction func actionSignUpTouch(_ sender: Any) {
        signUp()
    }
    
    @IBAction func actionSignInTouch(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTapShowOrHidePassword(_ tap: UITapGestureRecognizer) {
        self.showPassword = !self.showPassword
        inputPassword.isSecureTextEntry = !self.showPassword
    }
}
