//
//  StudentAccountNetwork.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/2/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import CleanModelViewIntent
import MealPlanDomain
class StudentAccountNetwork: NetworkHandler {
    private var network: Network
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    init(network: Network) {
        self.network = network
        self.bindNetwork(network: network)
    }
}
extension StudentAccountNetwork {
    /// Employ network to get details of student account
    ///
    /// - Parameter id: String
    func fetchStudentAccount(id: String) {
        network.fetchItem(id: id)
    }
    /// Send transfer request to school server
    ///
    /// - Parameter transfer: TransferEvent
    func recordTransfer(transfer: TransferEvent) {
        network.createItem(item: transfer)
    }
    /// Send conversion request to school server
    ///
    /// - Parameter conversion: ConversionEvent
    func recordConversion(conversion: ConversionEvent) {
        network.createItem(item: conversion)
    }
}
extension StudentAccountNetwork {
    enum StudentAccountNetworkResult: Result {
        case didFetchStudentAccount(StudentAccount)
        case didRecordTransfer
        case didRecordConversion
    }
}
extension TransferEvent: NetworkItem {
    
}
extension ConversionEvent: NetworkItem {
    
}
