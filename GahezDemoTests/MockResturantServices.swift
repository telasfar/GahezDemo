//
//  MockResturantServices.swift
//  GahezDemoTests
//
//  Created by Tariq Maged on 04/03/2022.
//

import Foundation
import Combine
@testable import GahezDemo

class MockResturantServices: ResturantServiceProtocol {
    
    var getCallsCount: Int = 0

    var getResult: Result<[ResturantModel], Error> = .success([ResturantModel]())

    func getResturants() -> AnyPublisher<[ResturantModel], Error> {
        getCallsCount += 1

        return getResult.publisher.eraseToAnyPublisher()
    }
}
