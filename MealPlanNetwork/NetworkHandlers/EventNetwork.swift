//
//  EventNetwork.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 2/28/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
class EventNetwork<T: EventType>: NetworkHandler {
    private var network: Network
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    init(network: Network) {
        self.network = network
        self.bindNetwork(network: network)
    }
    /// Employ network to get user dining events
    ///
    /// - Parameter user: String (userID)
    func fetchDiningEvents(userID: String) {
        network.queryItems(whereIDequals: userID)
    }
    /// Employ network to get user transfer events
    ///
    /// - Parameter user: String (userID)
    func fetchTransferEvents(userID: String) {
        network.queryItems(whereIDequals: userID)
    }
    /// Employ network to get user conversion events
    ///
    /// - Parameter user: String (userID)
    func fetchConversionEvents(userID: String) {
        network.queryItems(whereIDequals: userID)
    }
}
extension EventNetwork {
    enum EventNetworkResult: Result {
        case didFetchDiningEvents([EventType])
        case didFetchTransferEvents([EventType])
        case didFetchConversionEvents([EventType])
    }
}
