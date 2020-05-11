//
//  MenuVC.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 20/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

private let reuseIdentifer = "MenuOptionCell"

class MenuVC: UIViewController {
    
    // MARK: - Propretis

    private lazy var viewProfile: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = ColorName.blue.color
        return view
    }()
    
    private lazy var imageProfile: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        image.contentMode = .scaleAspectFit
        image.image = Asset.photoUser.image
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.text = "userName"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var userEmail: UILabel = {
        let label = UILabel()
        label.text = "userName@gmail.com"
        label.textColor = .white
        label.font.withSize(15)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var editUser: UIButton = {
        let button = UIButton()
        button.setImage(Asset.icEdit.image, for: .normal)
        button.addTarget(self, action: #selector(handleEditUserToggle), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.rowHeight = 80
        return table
    }()
    
    private lazy var viewSignOut: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    private lazy var buttonSignOut: UIButton = {
        let button = UIButton()
        let attr: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: ColorName.blue.color,
            .underlineStyle: NSUnderlineStyle.single.rawValue]
        let attributeString = NSMutableAttributedString(string: "Sign Out",
        attributes: attr)
        button.setAttributedTitle(attributeString, for: .normal)
        button.addTarget(self, action: #selector(handleSignOutToggle), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
    }
    
    // MARK: - Handlers
    
    @objc func handleEditUserToggle() {
        let profileVC = ProfileVC()
        navigationController?.pushViewController(profileVC, animated: true)
//        profileVC.modalPresentationStyle = .fullScreen
//        navigationController?.present(profileVC, animated: true, completion: nil)
    }
    
    @objc func handleSignOutToggle() {
        navigationController?.popViewController(animated: true)
    }
}

extension MenuVC: CodeViewProtocol {
    func buildViewHierarchy() {
        view.addSubview(viewProfile)
        imageProfile.addSubview(editUser)
        viewProfile.addSubview(stackView)
        stackView.addArrangedSubview(imageProfile)
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(userEmail)
        view.addSubview(tableView)
        view.addSubview(viewSignOut)
        viewSignOut.addSubview(buttonSignOut)
    }
    
    func setupConstraints() {
        viewProfile.anchor(top: view.topAnchor,
                           leading: view.leadingAnchor,
                           bottom: nil,
                           trailing: nil)
        viewProfile.anchor(height: 260, width: view.frame.width - 20)
        
        stackView.anchor(top: nil,
                         leading: viewProfile.leadingAnchor,
                         bottom: viewProfile.bottomAnchor,
                         trailing: nil,
                         insets: .init(top: 0, left: 52, bottom: 20, right: 0))
        
        editUser.anchor(top: imageProfile.topAnchor,
                        leading: nil,
                        bottom: nil,
                        trailing: imageProfile.trailingAnchor,
                        insets: .init(top: -20, left: 0, bottom: 0, right: -30))
        
        tableView.anchor(top: viewProfile.bottomAnchor,
                         leading: view.leadingAnchor,
                         bottom: viewSignOut.topAnchor,
                         trailing: view.trailingAnchor)
        
        viewSignOut.anchor(top: tableView.bottomAnchor,
                           leading: view.leadingAnchor,
                           bottom: view.bottomAnchor,
                           trailing: view.trailingAnchor)
        viewSignOut.anchor(height: 80, width: nil)
        
        buttonSignOut.anchor(top: viewSignOut.topAnchor,
                             leading: viewSignOut.leadingAnchor,
                             bottom: viewSignOut.bottomAnchor,
                             trailing: nil,
                             insets: .init(top: 0, left: 52, bottom: 20, right: 0))
    }
}

extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        let menu = MenuOption(rawValue: indexPath.row)
        cell.labelInfo.text = menu?.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuOption = MenuOption(rawValue: indexPath.row)
        switch menuOption {
        case .rideHistory:
            let rideHistoryVC = RideHistoryVC()
            navigationController?.pushViewController(rideHistoryVC, animated: true)
        case .payment:
            let paymentVC = PaymentVC()
            navigationController?.pushViewController(paymentVC, animated: true)
        case .promoCode:
            let promoCodeVC = PromoCodeVC()
            navigationController?.pushViewController(promoCodeVC, animated: true)
        case .support:
            let supportVC = SupportVC()
            navigationController?.pushViewController(supportVC, animated: true)
        default:
            return
        }
    }
    
}
