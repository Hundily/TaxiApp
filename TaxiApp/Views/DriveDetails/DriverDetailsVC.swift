//
//  DriverDetailsVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 06/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class DriverDetailsVC: UIViewController {

    @IBOutlet weak var viewDriverDetail: DriverDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Drive details"
        viewDriverDetail.setTypeView(type: .none)
    }
}
