//
//  ResturantViewModel.swift
//  GahezDemo
//
//  Created by Tariq Maged on 28/02/2022.
//

import Foundation
import Combine

enum ResturantViewModelState: Equatable {
    case loading
    case finishedLoading
    case error
}

final class ResturantViewModel {

    @Published private(set) var resturantModelArr: [ResturantModel]?
    @Published private(set) var state: ResturantViewModelState = .loading
  
    private var cancelable = Set<AnyCancellable>()
    var resturantService:ResturantServiceProtocol
    
    init(resturantService: ResturantServiceProtocol = ResturantServices.instance) {
        self.resturantService = resturantService
    }

    func fetchResturants() {
        state = .loading
        let resturantCompletionHandler: (Subscribers.Completion<Error>) -> Void = { [weak self] completion in
            switch completion {
            case .failure:
                self?.state = .error
            case .finished:
                self?.state = .finishedLoading
            }
        }
        
        resturantService.getResturants()
            .sink(receiveCompletion: resturantCompletionHandler, receiveValue: { [weak self] resturants in
                self?.resturantModelArr = resturants
            })
            .store(in: &cancelable)
    }
}

