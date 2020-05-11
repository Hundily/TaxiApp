//
//  AddPromoCodeVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 11/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class AddPromoCodeVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Add promocode"
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

    }
    
    @objc func textFieldDidChange() {
        textField.text = textField.text?.uppercased()
    }
}

extension AddPromoCodeVC: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
