//
//  Network.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 2/28/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
protocol Network: class {
    var networkResult: Box<NetworkResult> { get set }
    func fetchAllItems()
    func fetchItem(id: String)
    func createItem(item: NetworkItem)
    func updateItem(item: NetworkItem)
    func queryItems(whereIDequals: String)
    func authorize(email: String, password: String)
}
enum NetworkResult {
    case loading
    case error
    case success(Result)
}
protocol NetworkHandler: Service {
    func bindNetwork(network: Network)
}
protocol ServiceListener {
    func bindService(service: Service)
}
extension ServiceListener where Self: Service {
    /// Binds service result, relaying results back to another service
    ///
    /// - Parameter service: Service
    func bindService(service: Service) {
        service.serviceResult.bindListener { [weak self] result, _ in
            self?.serviceResult.accept(result)
        }
    }
}
extension NetworkHandler {
    /// Binds the network listener and passes results to service result
    ///
    /// - Parameter network: Network
    func bindNetwork(network: Network) {
        network.networkResult.bindListener { result, _ in
            switch result {
            case .loading:
                self.serviceResult.accept(ResultState.loading)
            case .error:
                self.serviceResult.accept(ResultState.error)
            case let .success(networkResult):
                self.serviceResult.accept(networkResult)
            }
        }
    }
}
protocol NetworkItem {
    
}
