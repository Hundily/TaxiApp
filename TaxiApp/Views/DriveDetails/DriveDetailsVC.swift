//
//  DriverDetailsVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 11/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class DriverDetailsVC: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var kDriverProfileCell = "DriverProfileCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Driver profile"
        setupViews()
        tableView.registerNib(DriverProfileCell.self)
    }
}

extension DriverDetailsVC: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.fullSuperview()
    }
}

extension DriverDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 812
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kDriverProfileCell) as! DriverProfileCell
        
        return cell
    }
}
