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
    
    var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = CGRect.zero
       return gradientLayer
    }()
    
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
        
//        contentView.layer.insertSublayer(gradientLayer, at: 0)
//        gradientLayer.frame = contentView.bounds
    }
    
    @objc func handleToggleDriverDetails() {
        delegate?.handleToogleDriverDetails()
    }
    
    @IBAction func actionRaiseIssue(_ sender: Any) {
        print("sdasda")
    }
    
}
