//
//  RideHistoryVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 23/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class RideHistoryVC: UIViewController {
    
    lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero)
        return table
    }()
    
    private let kRideHistoryCell = "RideHistoryCell"
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Ride History"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerNib(RideHistoryCell.self)
    }
    
}

extension RideHistoryVC: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.anchor(top: view.topAnchor,
                         leading: view.leadingAnchor,
                         bottom: view.bottomAnchor,
                         trailing: view.trailingAnchor,
                         insets: .init(top: 0, left: 20, bottom: 20, right: 20))
    }
    
}

extension RideHistoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kRideHistoryCell, for: indexPath) as! RideHistoryCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = RideDetailsVC()
        navigationController?.pushViewController(details, animated: true)
    }
    
}
