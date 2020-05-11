//
//  ProfileVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 11/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var labelNickName: UILabel!
    @IBOutlet weak var notificationSwift: UISwitch!
    @IBOutlet weak var viewInfos: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false

        viewInfos.addShandowView(radius: 4, cornerRadius: 16)
    }
}
