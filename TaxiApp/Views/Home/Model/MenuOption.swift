//
//  MenuOption.swift
//  TaxiApp
//
//  Created by Hundily Cerqueira on 23/04/20.
//  Copyright © 2020 Hundily Cerqueira. All rights reserved.
//

enum MenuOption: Int, CustomStringConvertible {
    case rideHistory
    case payment
    case promoCode
    case support
    
    var description: String {
        switch self {
        case .rideHistory:
            return "Ride History"
        case .payment:
            return "Payment"
        case .promoCode:
            return "PromoCode"
        case .support:
            return "Support"
        }
    }
}
