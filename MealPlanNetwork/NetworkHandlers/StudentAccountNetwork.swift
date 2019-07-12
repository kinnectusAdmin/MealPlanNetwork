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

protocol StudentAccountNetworkProtocol: NetworkHandler {
    func fetchStudentAccount(id: String)
}
public class StudentAccountNetwork: StudentAccountNetworkProtocol {
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
    public func fetchStudentAccount(id: String) {
        network.fetchItem(id: id)
    }
}
extension StudentAccountNetwork {
    public enum StudentAccountNetworkResult: Result {
        case didFetchStudentAccount(StudentAccount)
        case fetchStudentAccountFailure
    }
}
class MockStudentAccountNetwork: StudentAccountNetworkProtocol {
    var serviceResult: Box<Result> = Box(ResultState.loading)
    let passing: Bool = true
    func fetchStudentAccount(id: String) {
        serviceResult.accept(passing ? StudentAccountNetwork.StudentAccountNetworkResult.didFetchStudentAccount(StudentAccount.mock) : .fetchStudentAccountFailure)
    }
    
    
}
