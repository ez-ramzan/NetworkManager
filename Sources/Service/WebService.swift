//
//  WebService.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/18/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Object for sending url request and getting web data.

public final class WebService {
    
    ///Main settings web service.
    private let configuration: WebServiceConfigurationProtocol
    
    ///Web session.
    private let session: URLSession
    
    ///Qoeue for sending request, process and getting response.
    private let processingQueue: DispatchQueue
    
    ///Queue for returning a response.
    private let callbackQueue: DispatchQueue
    
    ///Performed tasks.
    private var tasks: [String: URLSessionTask]
    
    public init(configuration: WebServiceConfigurationProtocol, configurator: SessionConfiguratorProtocol? = nil, processingQueue: DispatchQueue = .global(qos: .utility), callbackQueue: DispatchQueue = .main) {
        self.configuration = configuration
        self.processingQueue = processingQueue
        self.callbackQueue = callbackQueue
        self.tasks = [String: URLSessionTask]()
        
        if let configuration = configurator?.buildURLSessionConfiguration() {
            self.session = URLSession(configuration: configuration)
        } else {
            self.session = URLSession.shared
        }        
    }
}

//MARK: - Public (WebServiceProtocol)

extension WebService: WebServiceProtocol {
    
    
    ///Methode for load url request
    public func load<WebRequest: WebRequestProtocol>(_ request: WebRequest, completion: @escaping (Result<WebRequest.Mapper.ObjectType, WebError>) -> ()) -> Cancellable? {
        
        let urlRequest: URLRequest
        
        switch URLRequestFactory.shared.buildURLRequest(with: configuration.url, webRequest: request, cachePolicy: configuration.cachePolicy, timeoutInterval: configuration.timeout) {
        case .success(let resultRequest):
            urlRequest = resultRequest
        case .failure(let error):
            self.callbackQueue.async {
                completion(.failure(WebError(serviceError: .buildRequest(error), systemError: nil)))
            }
            return nil
        }
        
        let id = UUID().uuidString
        let task = session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            self.processingQueue.async {
                switch self.handleNetworkResponse(data: data, response: response, error: error) {
                case .success(let data):
                    self.callbackQueue.async {
                        self.tasks.removeValue(forKey: id)
                        completion(request.mapperType.map(data))
                    }
                case .failure(let error):
                    self.callbackQueue.async {
                        self.tasks.removeValue(forKey: id)
                        completion(.failure(error))
                    }
                }
            }
        })
        
        processingQueue.async {
            self.tasks[id] = task
            task.resume()
        }
        
        return task
    }
}
