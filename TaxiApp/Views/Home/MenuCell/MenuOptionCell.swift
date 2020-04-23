//
//  MenuOptionCell.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 23/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    // MARK: - Propetis
    
    var labelInfo: UILabel = {
        let label = UILabel()
        label.text = "Teste"
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}

extension MenuOptionCell: CodeViewProtocol {
    
    func buildViewHierarchy() {
        addSubview(labelInfo)
    }
    
    func setupConstraints() {

        labelInfo.anchor(top: self.topAnchor,
                         leading: self.leadingAnchor,
                         bottom: self.bottomAnchor,
                         trailing: self.trailingAnchor,
                         insets: .init(top: 0, left: 52, bottom: 0, right: 0))
    }
    
}
