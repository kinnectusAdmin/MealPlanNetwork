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
public final class StudentAccountUseCase: Service, ServiceListener {
    private let network: StudentAccountNetworkProtocol
    public var serviceResult: Box<Result> = Box(ResultState.loading)
    init(network: StudentAccountNetworkProtocol) {
        self.network = network
        self.bindService(service: network)
    }
}
extension StudentAccountUseCase: MealPlanDomain.StudentAccountUseCase {
    /// Provides user account info from university database
    ///
    /// - Parameter id: String
    public func fetchStudentAccount(id: String) {
        network.fetchStudentAccount(id: id)
    }
}
