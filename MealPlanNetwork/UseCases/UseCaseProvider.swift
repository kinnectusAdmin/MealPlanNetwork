//
//  UseCaseProvider.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 2/28/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
import MealPlanDomain

public final class UseCaseProvider {
    public let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
}
extension UseCaseProvider {
    public static let shared: UseCaseProvider = UseCaseProvider()
}
extension UseCaseProvider {
    /// Provide service conforming to MealPlanUserUseCase
    ///
    /// - Returns: MealPlanUserUseCase
    public func provideMealPlanUserUseCase() -> MealPlanUserUseCase {
        return MealPlanUserUseCase(network: networkProvider.provideUserNetwork())
    }
    /// Provide service conforming to EventUseCase for Events
    ///
    /// - Returns: EventUseCase
    public func provideEventUseCase() -> EventUseCase {
        return EventUseCase(network: networkProvider.provideEventNetwork())
    }
    /// Provide service conforming to StudentAccountUseCase
    ///
    /// - Returns: StudentAccountUseCase
    public func provideStudentAccountUseCase() -> StudentAccountUseCase {
        return StudentAccountUseCase(network: networkProvider.provideStudenAccountNetwork())
    }
    /// Provides a mainfeed use case that contains services for events and student account
    ///
    /// - Returns: MainFeedUseCase
    public func provideMainFeedUseCase() -> MainFeedUseCase {
        return MainFeedUseCase()
    }
}
