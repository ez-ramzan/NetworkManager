//
//  StubWebService.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 10/4/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Object for sending stub request and getting stub response data.

public class StubWebService {

    
    ///Settings for stub web service.
    private let configuration: StubWebServiceConfigurationProtocol
    
    ///Queue for returning a response.
    private let callbackQueue: DispatchQueue
    
    public init(configuration: StubWebServiceConfigurationProtocol, callbackQueue: DispatchQueue = .main) {
        self.configuration = configuration
        self.callbackQueue = callbackQueue
    }
}

//MARK: - Public (WebServiceProtocol)

extension StubWebService: WebServiceProtocol {
    
    ///Method for load stub request.
    public func load<WebRequest>(_ request: WebRequest, completion: @escaping (Result<WebRequest.Mapper.ObjectType, WebError>) -> ()) -> Cancellable? where WebRequest : WebRequestProtocol {
        
        let urlRequest: URLRequest
        
        switch URLRequestFactory.shared.buildURLRequest(with: configuration.url, webRequest: request, cachePolicy: configuration.cachePolicy, timeoutInterval: configuration.timeout) {
        case .success(let resultRequest):
            urlRequest = resultRequest
        case .failure(let error):
            callbackQueue.async {
                completion(.failure(WebError(serviceError: .buildRequest(error), systemError: nil)))
            }
            return nil
        }
        
        guard let stubData = configuration.provider.getStub(for: urlRequest), let url = urlRequest.url else {
            callbackQueue.async {
                completion(.failure(WebError(serviceError: .emptyData, systemError: nil)))
            }
            return nil
        }
        
        let response = HTTPURLResponse(url: url, statusCode: stubData.statusCode, httpVersion: stubData.httpVersion, headerFields: nil)
        let delayTime = DispatchTime.now() + stubData.delay
        
        switch handleNetworkResponse(data: stubData.data?.decode(), response: response, error: stubData.error) {
        case .success(let data):
            callbackQueue.asyncAfter(deadline: delayTime) {
                completion(request.mapperType.map(data))
            }
        case .failure(let error):
            callbackQueue.asyncAfter(deadline: delayTime) {
                completion(.failure(error))
            }
        }

        return nil
    }
}
