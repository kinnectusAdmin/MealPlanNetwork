//
//  EventUseCase.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/2/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
import CleanModelViewIntent
final class EventUseCase<T: EventType>: Service, ServiceListener {
    var serviceResult: Box<Result> = Box(ResultState.loading)
    private var network: EventNetwork<T>
    init(network: EventNetwork<T>) {
        self.network = network
        self.bindService(service: network)
    }
}
extension EventUseCase: MealPlanDomain.EventUseCase {
    func fetchDiningEvents(userID: String) {
        network.fetchDiningEvents(userID: userID)
    }
    
    func fetchTransferEvents(userID: String) {
        network.fetchTransferEvents(userID: userID)
    }
    
    func fetchConversionEvents(userID: String) {
        network.fetchConversionEvents(userID: userID)
    }
}
