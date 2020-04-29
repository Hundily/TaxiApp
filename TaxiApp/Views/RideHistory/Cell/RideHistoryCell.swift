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

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        viewCell.layer.masksToBounds = false
        viewCell.layer.shadowOpacity = 0.23
        viewCell.layer.shadowRadius = 4
        viewCell.layer.shadowOffset = CGSize(width: 0, height: 0)
        viewCell.layer.shadowColor = UIColor.black.cgColor
        viewCell.layer.cornerRadius = 16
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
