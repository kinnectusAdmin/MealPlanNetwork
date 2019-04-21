//
//  FirebaseAPI.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/2/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
enum FirebaseAPI {
    case users
    var collection: String {
        switch self {
        case .users: return "MealPlanUser"
        }
    }
}
