//
//  PaymentCell.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 18/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class PaymentCell: UITableViewCell {
    
    @IBOutlet weak var viewCamera: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        viewCamera.addShandowView(radius: 8, cornerRadius: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PaymentCell: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}
