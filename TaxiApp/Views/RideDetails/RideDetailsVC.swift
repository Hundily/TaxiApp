//
//  RideDetailsVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 11/05/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

protocol HandleDriverDetailsToggle {
    func handleToogleRaiseIssue()
    func handleToogleDriverDetails()
}

class RideDetailsVC: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var kRideDetailsCell = "RideDetailsCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.registerNib(RideDetailsCell.self)
        setupViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Ride details"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
    }
}

extension RideDetailsVC: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.fullSuperview()
    }
}

extension RideDetailsVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 900
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kRideDetailsCell) as! RideDetailsCell

        cell.delegate = self
        return cell
    }

}

extension RideDetailsVC: HandleDriverDetailsToggle {
    func handleToogleRaiseIssue() {
        //
    }
    
    func handleToogleDriverDetails() {
        let driverDetails = DriverDetailsVC()
        navigationController?.pushViewController(driverDetails, animated: true)
    }
}
