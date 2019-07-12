//
//  WebAPI.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/2/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation

/// Holds All Web relative URLs and (possibly) handlers necessary for CRUD functionality
///
/// - users: API for users in University server
/// - balance: API for balance related items in University server
/// - dining: API for dining related items in University server
/// - transfer: API for transfer related items in University server
/// - conversion: API for conversion related items in University server
/// - account: API for accounts in University server
enum WebAPI {
    case users
    case balance
    case dining
    case transfer
    case conversion
    case account
}
