//
//  DriverProfileCell.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 11/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class DriverProfileCell: UITableViewCell {
    
    @IBOutlet weak var viewDriveProfile: DriverDetail!
    @IBOutlet weak var viewStarProfile: InfoProfile!
    @IBOutlet weak var viewLoveProfile: InfoProfile!
    @IBOutlet weak var viewCalendarProfile: InfoProfile!
    @IBOutlet weak var viewCarDetail: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        viewDriveProfile.setTypeView(type: .none)
        viewStarProfile.setTypeInfo(.star)
        viewLoveProfile.setTypeInfo(.love)
        viewCalendarProfile.setTypeInfo(.calendar)
        
        viewCarDetail.layer.cornerRadius = 16
        viewCarDetail.layer.borderColor = ColorName.grayBorder.color.cgColor
        viewCarDetail.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
