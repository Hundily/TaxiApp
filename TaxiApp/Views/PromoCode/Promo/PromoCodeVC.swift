//
//  PromoCodeVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 23/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class PromoCodeVC: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
//        tableView.backgroundColor = .purple
        tableView.separatorStyle = .none
//        tableView.delegate = self
//        tableView.dataSource = self
        return tableView
    }()
    
    private lazy var viewBotton: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let button: CustomButton = {
        let button = CustomButton()
        button.setTitle("Add promocode", for: .normal)
        button.layoutButton(.enabled)
        button.addTarget(self, action: #selector(handleAddPromoCodeToggle), for: .touchUpInside)
        return button
    }()
    
    private var kPromoCodeCell = "PromoCodeCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Promo"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.title = " "
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(PromoCodeCell.self)
    }
    
    @objc func handleAddPromoCodeToggle() {
        print("handleAddPromoCodeToggle")
        let addPromoCodeVC = AddPromoCodeVC()
        navigationController?.pushViewController(addPromoCodeVC, animated: true)
    }
}

extension PromoCodeVC: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(viewBotton)
        viewBotton.addSubview(button)
    }
    
    func setupConstraints() {
        tableView.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: viewBotton.topAnchor,
                        trailing: view.trailingAnchor)
        
        viewBotton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, insets: .init(top: 20, left: 20, bottom: 0, right: 20))
        viewBotton.anchor(height: 100, width: nil)
        
        button.anchor(top: viewBotton.topAnchor, leading: viewBotton.leadingAnchor, bottom: viewBotton.bottomAnchor, trailing: viewBotton.trailingAnchor, insets: .init(top: 20, left: 0, bottom: 20, right: 0))
    }
}

extension PromoCodeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kPromoCodeCell, for: indexPath) as! PromoCodeCell
        
        return cell
    }
}
