//
//  CustomButton.swift
//  PicPayment
//
//  Created by Hundily Cerqueira Silva on 27/11/19.
//  Copyright © 2019 PicPayment. All rights reserved.
//

import UIKit
import Foundation

class CustomTextField: UITextField {

    init() {
        super.init(frame: .zero)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        layoutInput()
    }

    func layoutInput() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
        layer.cornerRadius = 15
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.gray.cgColor
        layer.masksToBounds = true
    }
    
    func addRightImageTextField(andImage img: UIImage, hasTapGesture: UITapGestureRecognizer?) {
        let rightImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        rightImageView.contentMode = .scaleAspectFit
        if let tap = hasTapGesture {
            rightImageView.addGestureRecognizer(tap)
            rightImageView.isUserInteractionEnabled = true
        }
        rightImageView.image = img
        rightView = rightImageView
        rightViewMode = .always
    }
}
