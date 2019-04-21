//
//  StudentAccountUseCase.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 3/2/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain
import CleanModelViewIntent
final class StudentAccountUseCase: Service, ServiceListener {
    private let network: StudentAccountNetwork
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    init(network: StudentAccountNetwork) {
        self.network = network
        self.bindService(service: network)
    }
}
extension StudentAccountUseCase: MealPlanDomain.StudentAccountUseCase {
    /// Provides user account info from university database
    ///
    /// - Parameter id: String
    func fetchStudentAccount(id: String) {
        network.fetchStudentAccount(id: id)
    }
    /// Creates and stores a user transfer event and returns result
    ///
    /// - Parameter transfer: TransferEvent
    func recordTransfer(transfer: TransferEvent) {
        network.recordTransfer(transfer: transfer)
    }
    /// Create and store a user to user conversion event and returns result
    ///
    /// - Parameter conversion: ConversionEvent
    func recordConversion(conversion: ConversionEvent) {
        network.recordConversion(conversion: conversion)
    }
}
