//
//  UseCaseProvider.swift
//  MealPlanNetwork
//
//  Created by blakerogers on 2/28/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import Foundation
final class UseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
}
extension UseCaseProvider {
    func provideMealPlanUserUseCase() -> MeanPlanUserUseCase {
        return MeanPlanUserUseCase(network: networkProvider.provideUserNetwork())
    }
}
