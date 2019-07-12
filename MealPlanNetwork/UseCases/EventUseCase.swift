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
public final class EventUseCase: Service, ServiceListener {
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    private var network: EventNetworkProtocol
    init(network: EventNetworkProtocol) {
        self.network = network
        self.bindService(service: network)
    }
}
extension EventUseCase: MealPlanDomain.EventUseCase {
    /// Fethches all dining events relative to user
    ///
    /// - Parameter userID: String
    public func fetchDiningEvents(userID: String) {
        network.fetchDiningEvents(userID: userID)
    }
    /// Fetches all transfer events relative to user
    ///
    /// - Parameter userID: String
    public func fetchTransferEvents(userID: String) {
        network.fetchTransferEvents(userID: userID)
    }
    /// Fetches all Conversion events relative to user
    ///
    /// - Parameter userID: String
    public func fetchConversionEvents(userID: String) {
        network.fetchConversionEvents(userID: userID)
    }
    /// Creates and stores a user transfer event
    ///
    /// - Parameter transfer: TransferEvent
    public func recordTransfer(transfer: TransferEvent) {
        network.recordTransfer(transfer: transfer)
    }
    /// Create and store a user to user conversion event
    ///
    /// - Parameter conversion: ConversionEvent
    public func recordConversion(conversion: ConversionEvent) {
        network.recordConversion(conversion: conversion)
    }
}
