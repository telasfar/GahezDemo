//
//  ResturantService.swift
//  GahezDemo
//
//  Created by Tariq Maged on 28/02/2022.
//

import Foundation
import Combine


enum ServiceError: Error {
    case url(URLError)
    case urlRequest
    case decode
}

protocol ResturantServiceProtocol {
    func getResturants() -> AnyPublisher<[ResturantModel], Error>
}

class ResturantServices:ResturantServiceProtocol{
    
    
    static let instance = ResturantServices() 
        
        func getResturants() -> AnyPublisher<[ResturantModel], Error> {
            
            var dataTask: URLSessionDataTask?
            
            let onSubscription: (Subscription) -> Void = { _ in dataTask?.resume() }
            let onCancel: () -> Void = { dataTask?.cancel() }

            return Future<[ResturantModel], Error> { [weak self] promise in
                guard let urlRequest = self?.getUrlRequest() else {
                    promise(.failure(ServiceError.urlRequest))
                    return
                }
                
                dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
                    guard let data = data else {
                        if let error = error {
                            promise(.failure(error))
                        }
                        return
                    }
                    do {
                        let resturants = try JSONDecoder().decode([ResturantModel].self, from: data)
                        promise(.success(resturants))
                    } catch {
                        promise(.failure(ServiceError.decode))
                    }
                }
            }
            .handleEvents(receiveSubscription: onSubscription, receiveCancel: onCancel)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        }
    
    private func getUrlRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jahez-other-oniiphi8.s3.eu-central-1.amazonaws.com"
        components.path = "/restaurants.json"
        guard let url = components.url else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.timeoutInterval = 10.0
        urlRequest.httpMethod = "GET"
        return urlRequest
    }

    func testFetchResturants(complition: @escaping (_ status:Bool,_ product:ResturantModel?)->Void){
        guard let urlRequest = getUrlRequest() else {return}
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, err) in
            if let data = data{
                do{
                    let responseModel = try JSONDecoder().decode(ResturantModel.self, from: data)
                    complition(true,responseModel)
                }catch{
                    complition(false,nil)
                    debugPrint(error.localizedDescription)
                }
            }else{
                complition(false,nil)
            }
        }
        task.resume()
    }

}
