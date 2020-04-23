//
//  HomeVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 20/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit
import MapKit

class HomeVC: UIViewController {
    
    // MARK: - Propretis
    
    var delegate: HomeVCDelegate?
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView(frame: .zero)
        return map
    }()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        setupViews()
    }
    
    // MARK: - Handlers
    
    @objc func handleMenuToggle() {
        delegate?.handleMenuToggle()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Asset.icMenu.image, style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}

extension HomeVC: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(mapView)
    }

    func setupConstraints() {
        mapView.fullSuperview()
    }
}
