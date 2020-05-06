//
//  DriverDetail.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 29/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

enum DriverDetailType {
    case none
    case showAllInfos
}

class DriverDetail: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var stackViewEvaluate: UIStackView!
    @IBOutlet weak var imageGoAhead: UIImageView!
    private var showShadow = false
    
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
    }
    
    func setTypeView(type: DriverDetailType) {
        switch type {
        case .none:
            stackViewEvaluate.isHidden = true
            imageGoAhead.isHidden = true
        case .showAllInfos:
            contentView.addShandowView(radius: 4, cornerRadius: 16)
        }
    }
}
