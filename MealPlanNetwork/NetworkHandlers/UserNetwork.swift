//
//  UserNetwork.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 2/28/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain

protocol UserNetworkProtocol: NetworkHandler {
    func fetchAllUsers()
    func fetchUser(id: String)
    func createUser(user: MealPlanUser)
    func updateUser(user: MealPlanUser)
    func loginUser(email: String, password: String)
}
public class UserNetwork: UserNetworkProtocol {
    private var network: Network
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    init(network: Network) {
        self.network = network
        self.bindNetwork(network: network)
    }
    //Get users and past to result
    public func fetchAllUsers() {
        network.fetchAllItems()
    }
     //get specific user and past to result
    public func fetchUser(id: String) {
       network.fetchItem(id: id)
    }
    //creates a user and pass success or failure to user
    public func createUser(user: MealPlanUser) {
        network.createItem(item: user )
    }
    // update a user in the database
    public func updateUser(user: MealPlanUser) {
        network.updateItem(item: user)
    }
    /// Logs a user in with email password credentials
    ///
    /// - Parameters:
    ///   - email: String
    ///   - password: String
    public func loginUser(email: String, password: String) {
        network.authorize(email: email, password: password)
    }
}
public class MockUserNetwork: UserNetworkProtocol {
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    private let passing: Bool = true
    public func fetchAllUsers() {
        let users = (0...10).map {_ in return MealPlanUser.local}
        serviceResult.accept(passing ? UserNetwork.UserNetworkResult.didFetchAllUsers(users) : .fetchUsersFailure)
    }
    
    public func fetchUser(id: String) {
        serviceResult.accept(passing ? UserNetwork.UserNetworkResult.didFetchUser(MealPlanUser.local): .fetchUserFailure)
    }
    
    public func createUser(user: MealPlanUser) {
        serviceResult.accept(passing ? UserNetwork.UserNetworkResult.didCreateUser(MealPlanUser.local) : .createUserFailure)
    }
    
    public func updateUser(user: MealPlanUser) {
        serviceResult.accept(passing ? UserNetwork.UserNetworkResult.didUpdateUser(MealPlanUser.local) : .updateUserFailure)
    }
    
    public func loginUser(email: String, password: String) {
        serviceResult.accept(passing ? UserNetwork.UserNetworkResult.didLoginUser(MealPlanUser.local) : .loginUserFailure)
    }
}
extension UserNetwork {
    public enum UserNetworkResult: Result {
        case didFetchUser(MealPlanUser)
        case didFetchAllUsers([MealPlanUser])
        case didCreateUser(MealPlanUser)
        case didUpdateUser(MealPlanUser)
        case didLoginUser(MealPlanUser)
        case loginUserFailure
        case updateUserFailure
        case createUserFailure
        case fetchUsersFailure
        case fetchUserFailure
    }
}
extension MealPlanUser: NetworkItem {
    
}
