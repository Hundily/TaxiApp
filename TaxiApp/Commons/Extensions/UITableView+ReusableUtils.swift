//
//  UITableView+ReusableUtils.swift
//  PicPayment
//
//  Created by Hundily Cerqueira on 11/09/19.
//  Copyright © 2019 PicPayment. All rights reserved.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func registerNib<T: UITableViewCell>(_: T.Type) {
        register(UINib(nibName: String(describing: T.self), bundle: Bundle.main), forCellReuseIdentifier: T.identifier)
    }

    func register<T: UITableViewHeaderFooterView>(_: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier : \(T.identifier)")
        }

        return cell
    }
}
