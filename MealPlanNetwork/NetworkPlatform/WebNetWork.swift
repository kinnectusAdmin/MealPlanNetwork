//
//  WebNetWork.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/1/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent

class WebNetwork: Network {
    private let api: WebAPI
    var networkResult: Box<NetworkResult>  = Box(NetworkResult.loading)
    init(api: WebAPI) {
        self.api = api
    }
}
extension WebNetwork {
    
    /// Fetch items in external server
    func fetchAllItems() {}
    /// Fetch specific id buy id in external server
    ///
    /// - Parameter id: NetworkItem
    func fetchItem(id: String) {}
    /// Create an item in external database
    ///
    /// - Parameter item: NetworkItem
    func createItem(item: NetworkItem) {}
    /// Update item in external database
    ///
    /// - Parameter item: NetworkItem
    func updateItem(item: NetworkItem) {}
    /// Query items by id in external database
    ///
    /// - Parameter whereIDequals: NetworkItem
    func queryItems(whereIDequals: String) {}
    /// Authorize user in firebase attempting login
    ///
    /// - Parameters:
    ///   - email: String
    ///   - password: String
    func authorize(email: String, password: String) {}
}
