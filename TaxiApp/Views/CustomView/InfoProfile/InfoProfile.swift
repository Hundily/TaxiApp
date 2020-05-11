//
//  InfoProfile.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 06/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

enum InfoProfileType {
    case star, love, calendar
}

class InfoProfile: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        loadCustomView(viewClass: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = ColorName.grayBorder.color.cgColor
        contentView.layer.cornerRadius = 16
    }
    
    func setTypeInfo(_ type: InfoProfileType) {
        switch type {
        case .star:
            return
        case .love:
            imageIcon.image = UIImage(named: "icon_love")
            label.text = "123"
        case .calendar:
            imageIcon.image = UIImage(named: "icon_calendar")
            label.text = "2 years"
        }
        
    }
    
}
