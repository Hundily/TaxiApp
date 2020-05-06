//
//  RideHistoryCell.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 24/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class RideHistoryCell: UITableViewCell {
    
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var customView: StartEndAddressView!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        viewCell.addShandowView(radius: 4, cornerRadius: 16)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
