//
//  FirebaseNetwork.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 2/28/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
//TODO: Import Firebase
class FirebaseNetwork: Network {
    private let api: FirebaseAPI
    var networkResult: Box<NetworkResult> = Box(.loading)
    init(api: FirebaseAPI) {
        self.api = api
    }
}
extension FirebaseNetwork {
    //Get items of a collection and past results to delegate
    func fetchAllItems() {
    }
    //get specific document and past results to delegate
    func fetchItem(id: String) {
    }
     //creates an item and pass success or failure to user
    func createItem(item: NetworkItem) {
    }
    //Updates document in collection
    func updateItem(item: NetworkItem) {
    }
    /// Query items is a collection according to id
    ///
    /// - Parameter whereIDequals: String
    func queryItems(whereIDequals: String) {
    }
    /// Authorize user in firebase attempting login
    ///
    /// - Parameters:
    ///   - email: String
    ///   - password: String
    func authorize(email: String, password: String) {
        
    }
}

