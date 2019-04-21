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
    
    func fetchAllItems() {
        
    }
    
    func fetchItem(id: String) {
    }
    
    func createItem(item: NetworkItem) {
    }
    
    func updateItem(item: NetworkItem) {
    }
    func queryItems(whereIDequals: String) {
        
    }
}
