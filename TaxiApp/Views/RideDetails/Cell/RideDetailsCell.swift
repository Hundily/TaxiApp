//
//  RideDetailsCell.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 29/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class RideDetailsCell: UITableViewCell {
    
    @IBOutlet weak var viewRideDetails: UIView!
    @IBOutlet weak var viewStartEndAddress: StartEndAddressView!
    @IBOutlet weak var viewDriverDetail: DriverDetail!
    var delegate: HandleDriverDetailsToggle?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupUI() {
        viewRideDetails.layer.borderWidth = 1
        viewRideDetails.layer.borderColor = ColorName.grayBorder.color.cgColor
        let tapViewDriveDetails = UITapGestureRecognizer(target: self, action: #selector(handleToggleDriverDetails))
        viewDriverDetail.addGestureRecognizer(tapViewDriveDetails)
        viewDriverDetail.setTypeView(type: .showAllInfos)
    }
    
    @objc func handleToggleDriverDetails() {
        delegate?.handleToogleDriverDetails()
    }
    
    @IBAction func actionRaiseIssue(_ sender: Any) {
        print("sdasda")
    }
    
}
