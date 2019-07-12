//
//  MainFeedUseCase.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 6/23/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation

import Foundation
import MealPlanDomain
import CleanModelViewIntent

public final class MainFeedUseCase: Service, ServiceListener {
    private let eventUseCase: EventUseCase
    private let studentAccountUseCase: StudentAccountUseCase
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    init() {
        self.studentAccountUseCase = UseCaseProvider.shared.provideStudentAccountUseCase()
        self.eventUseCase = UseCaseProvider.shared.provideEventUseCase()
        self.bindService(service: eventUseCase)
        self.bindService(service: studentAccountUseCase)
    }
}
extension MainFeedUseCase: MealPlanDomain.StudentAccountUseCase {
    /// Provides user account info from university database
    ///
    /// - Parameter id: String
    public func fetchStudentAccount(id: String) {
        studentAccountUseCase.fetchStudentAccount(id: id)
    }
}
extension MainFeedUseCase: MealPlanDomain.EventUseCase {
    /// Fethches all dining events relative to user
    ///
    /// - Parameter userID: String
    public func fetchDiningEvents(userID: String) {
        eventUseCase.fetchDiningEvents(userID: userID)
    }
    /// Fetches all transfer events relative to user
    ///
    /// - Parameter userID: String
    public func fetchTransferEvents(userID: String) {
        eventUseCase.fetchTransferEvents(userID: userID)
    }
    /// Fetches all Conversion events relative to user
    ///
    /// - Parameter userID: String
    public func fetchConversionEvents(userID: String) {
        eventUseCase.fetchConversionEvents(userID: userID)
    }
    /// Creates and stores a user transfer event
    ///
    /// - Parameter transfer: TransferEvent
    public func recordTransfer(transfer: TransferEvent) {
        eventUseCase.recordTransfer(transfer: transfer)
    }
    /// Create and store a user to user conversion event
    ///
    /// - Parameter conversion: ConversionEvent
    public func recordConversion(conversion: ConversionEvent) {
        eventUseCase.recordConversion(conversion: conversion)
    }
}
