//
//  UITextField+Extensions.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 16/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

extension UITextField {

    static func setStyles(input: UITextField) -> UITextField {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: input.frame.height))
        input.leftView = paddingView
        input.leftViewMode = UITextField.ViewMode.always
        input.layer.cornerRadius = 15
        input.layer.borderWidth = 0.5
        input.layer.borderColor = UIColor.gray.cgColor
        input.layer.masksToBounds = true
        
        return input
    }
    
    static func addImageTextField(input: UITextField, andImage img: UIImage) {
        let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        rightImageView.image = img
        rightImageView.isUserInteractionEnabled = true
        input.rightView = rightImageView
        input.rightViewMode = .always
    }

}
