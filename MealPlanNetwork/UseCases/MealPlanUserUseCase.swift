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
public final class MealPlanUserUseCase: Service, ServiceListener {
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    private var network: UserNetworkProtocol
    init(network: UserNetworkProtocol) {
        self.network = network
        self.bindService(service: network)
    }
}
extension MealPlanUserUseCase: MealPlanDomain.MealPlanUserUseCase {
    /// Gets all users from database
    public func fetchAllUsers() {
        network.fetchAllUsers()
    }
    /// Gets a specific user from database
    ///
    /// - Parameter id: String
    public func fetchUser(id: String) {
        network.fetchUser(id: id)
    }
    /// Creates a user returns result of success or failure via a listener
    ///
    /// - Parameter user: MealPlanUser
    public func createUser(user: MealPlanUser) {
        network.createUser(user: user)
    }
    /// Updates users info on database
    ///
    /// - Parameter user: MealPlanUser
    public func updateUser(user: MealPlanUser) {
        network.updateUser(user: user)
    }
    /// Login a user
    ///
    /// - Parameters:
    ///   - email: String
    ///   - password: String
    public func loginUser(email: String, password: String) {
        network.loginUser(email: email, password: password)
    }
}
