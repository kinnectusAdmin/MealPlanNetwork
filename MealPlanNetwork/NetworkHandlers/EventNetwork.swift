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

protocol EventNetworkProtocol: NetworkHandler {
    func fetchDiningEvents(userID: String)
    func fetchTransferEvents(userID: String)
    func fetchConversionEvents(userID: String)
    func recordTransfer(transfer: TransferEvent)
    func recordConversion(conversion: ConversionEvent)
}
public class EventNetwork: EventNetworkProtocol {
    
    private var diningNetwork: Network
    private var transferNetwork: Network
    private var conversionNetwork: Network
    
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    
    init(diningNetwork: Network, transferNetwork: Network, conversionNetwork: Network) {
        self.diningNetwork = diningNetwork
        self.transferNetwork = transferNetwork
        self.conversionNetwork = conversionNetwork
        self.bindNetwork(network: diningNetwork)
        self.bindNetwork(network: transferNetwork)
        self.bindNetwork(network: conversionNetwork)
    }
    /// Employ network to get user dining events
    ///
    /// - Parameter user: String (userID)
    public func fetchDiningEvents(userID: String) {
        diningNetwork.queryItems(whereIDequals: userID)
    }
    /// Employ network to get user transfer events
    ///
    /// - Parameter user: String (userID)
    public func fetchTransferEvents(userID: String) {
        transferNetwork.queryItems(whereIDequals: userID)
    }
    /// Employ network to get user conversion events
    ///
    /// - Parameter user: String (userID)
    public func fetchConversionEvents(userID: String) {
        conversionNetwork.queryItems(whereIDequals: userID)
    }
    /// Send transfer request to school server
    ///
    /// - Parameter transfer: TransferEvent
    public func recordTransfer(transfer: TransferEvent) {
        transferNetwork.createItem(item: transfer)
    }
    /// Send conversion request to school server
    ///
    /// - Parameter conversion: ConversionEvent
    public func recordConversion(conversion: ConversionEvent) {
        conversionNetwork.createItem(item: conversion)
    }
}
extension EventNetwork {
    public enum EventNetworkResult: Result {
        case didFetchDiningEvents([DiningEvent])
        case didFetchTransferEvents([TransferEvent])
        case didFetchConversionEvents([ConversionEvent])
        case fetchTransferEventsFailure
        case fetchConversionEventsFailure
        case fetchDiningEventsFailure
        case didRecordTransfer
        case didRecordConversion
        case recordTransferFailure
        case recordConversionFailure
    }
}
extension TransferEvent: NetworkItem {
    
}
extension ConversionEvent: NetworkItem {
    
}
class MockEventNetwork: EventNetworkProtocol {
    var serviceResult: Box<Result> = Box(ResultState.loading)
    var passing: Bool = true
    func fetchDiningEvents(userID: String) {
        let events = (0...10).map { _ in return DiningEvent.defaultEvent}
        serviceResult.accept(passing ? EventNetwork.EventNetworkResult.didFetchDiningEvents(events) : .fetchDiningEventsFailure)
    }
    
    func fetchTransferEvents(userID: String) {
        let events = (0...10).map { _ in return TransferEvent.defaultEvent}
        serviceResult.accept(passing ? EventNetwork.EventNetworkResult.didFetchTransferEvents(events) : .fetchTransferEventsFailure)
    }
    
    func fetchConversionEvents(userID: String) {
        let events = (0...10).map { _ in return ConversionEvent.defaultEvent}
        serviceResult.accept(passing ? EventNetwork.EventNetworkResult.didFetchConversionEvents(events) : .fetchConversionEventsFailure)
    }
    /// Send transfer request to school server
    ///
    /// - Parameter transfer: TransferEvent
    func recordTransfer(transfer: TransferEvent) {
        serviceResult.accept(passing ? EventNetwork.EventNetworkResult.didRecordTransfer : .recordTransferFailure)
    }
    /// Send conversion request to school server
    ///
    /// - Parameter conversion: ConversionEvent
    func recordConversion(conversion: ConversionEvent) {
        serviceResult.accept(passing ? EventNetwork.EventNetworkResult.didRecordConversion : .recordConversionFailure)
    }
}
