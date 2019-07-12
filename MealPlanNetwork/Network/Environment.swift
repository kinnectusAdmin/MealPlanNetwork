//
//  Environment.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 6/20/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
enum Environment {
    case development
    case testing
    case production
    static let current: Environment = .testing
}
