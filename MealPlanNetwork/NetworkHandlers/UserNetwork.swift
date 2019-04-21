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
class UserNetwork: NetworkHandler {
    private var network: Network
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    init(network: Network) {
        self.network = network
        self.bindNetwork(network: network)
    }
    //Get users and past to result
    func fetchAllUsers() {
        network.fetchAllItems()
    }
     //get specific user and past to result
    func fetchUser(id: String) {
       network.fetchItem(id: id)
    }
    //creates a user and pass success or failure to user
    func createUser(user: MealPlanUser) {
        network.createItem(item: user )
    }
    // update a user in the database
    func updateUser(user: MealPlanUser) {
        network.updateItem(item: user)
    }
}
extension UserNetwork {
    enum UserNetworkResult: Result {
        case didFetchUser(MealPlanUser)
        case didFetchAllUsers([MealPlanUser])
        case didCreateUser
        case didUpdateUser
    }
}
extension MealPlanUser: NetworkItem {
    
}
