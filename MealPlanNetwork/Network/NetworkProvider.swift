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
    /// Current evironment of all services will determine type of network/service returned
    private let environment: Environment = Environment.current
    /// Provides User network backed by firebase
    ///
    /// - Returns: UserNetwork
    func provideUserNetwork() -> UserNetworkProtocol {
        switch environment {
        case .development, .production:
            return UserNetwork(network: FirebaseNetwork(api: .users))
        case .testing:
            return MockUserNetwork()
        }
    }
    /// Provide event network backed by web api
    ///
    /// - Returns: EventNetwork
    func provideEventNetwork() -> EventNetworkProtocol {
        switch environment {
        case .development, .production:
            return EventNetwork(diningNetwork: WebNetwork(api: .dining), transferNetwork: WebNetwork(api: .transfer), conversionNetwork: WebNetwork(api: .conversion))
        case .testing:
            return MockEventNetwork()
        }
    }
    /// Provide student account network backed by web api
    ///
    /// - Returns: StudentAccountNetwork
    func provideStudenAccountNetwork() -> StudentAccountNetworkProtocol {
        switch environment {
        case .development, .production:
            return StudentAccountNetwork(network: WebNetwork(api: .account))
        case .testing:
            return MockStudentAccountNetwork()
        }
        
    }
}
