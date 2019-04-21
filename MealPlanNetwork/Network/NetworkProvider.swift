//
//  NetworkProvider.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/1/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
public final class NetworkProvider {
    //TODO: Make individual networks
    func provideUserNetwork() -> UserNetwork {
        return UserNetwork(network: FirebaseNetwork(api: .users))
    }
    func provideDiningEventNetwork() -> EventNetwork<DiningEvent> {
        return EventNetwork(network: WebNetwork(api: .dining))
    }
    func provideTransferEventNetwork() -> EventNetwork<TransferEvent> {
        return EventNetwork(network: WebNetwork(api: .transfer))
    }
    func provideConversionEventNetwork() -> EventNetwork<ConversionEvent> {
        return EventNetwork(network: WebNetwork(api: .conversion))
    }
}

