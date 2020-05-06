//
//  RideDetailsVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 29/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

protocol HandleDriverDetailsToggle {
    func handleToogleDriverDetails()
    func handleToogleRaiseIssue()
}

class RideDetailsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let kRideDetailsCell = "RideDetailsCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(RideDetailsCell.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "Ride Details"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
    }
}

extension RideDetailsVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kRideDetailsCell) as! RideDetailsCell
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 850
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
