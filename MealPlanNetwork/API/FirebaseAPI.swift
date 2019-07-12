//
//  FirebaseAPI.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/2/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
/// Utilize to handle Firebase relative objects in server
enum FirebaseAPI {
    case users
    var collection: String {
        switch self {
        case .users: return "MealPlanUser"
        }
    }
}
