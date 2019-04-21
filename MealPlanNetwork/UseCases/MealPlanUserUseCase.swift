//
//  MealPlanUserUseCase.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/1/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
import CleanModelViewIntent
final class MeanPlanUserUseCase: Service, ServiceListener {
    var serviceResult: Box<Result> = Box(ResultState.loading)
    private var network: UserNetwork
    init(network: UserNetwork) {
        self.network = network
        self.bindService(service: network)
    }
}
extension MeanPlanUserUseCase: MealPlanDomain.MealPlanUserUseCase {
    /// Gets all users from database
    func fetchAllUsers() {
        network.fetchAllUsers()
    }
    /// Gets a specific user from database
    ///
    /// - Parameter id: String
    func fetchUser(id: String) {
        network.fetchUser(id: id)
    }
    /// Creates a user returns result of success or failure via a listener
    ///
    /// - Parameter user: MealPlanUser
    func createUser(user: MealPlanUser) {
        network.createUser(user: user)
    }
    /// Updates users info on database
    ///
    /// - Parameter user: MealPlanUser
    func updateUser(user: MealPlanUser) {
        network.updateUser(user: user)
    }
}
