//
//  URLRequestFactory.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/27/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Factory for build url request through web request type of WebRequestProtocol.

public final class URLRequestFactory {
    
    static let shared = URLRequestFactory()
    
    private init() {}
}


//MARK: - Public (Build URL request method)
extension URLRequestFactory {
    
    ///Method for build URL Request with web request type of WebRequestProtocol.
    public func buildURLRequest<WebRequest: WebRequestProtocol>(with baseURL: URL, webRequest: WebRequest, cachePolicy: URLRequest.CachePolicy, timeoutInterval: TimeInterval) -> Result<URLRequest, RequestError> {
        
        guard var components = URLComponents(string: baseURL.absoluteString) else {
            return .failure(.baseURLToComponents)
        }
        
        components.path = webRequest.path
        
        var httpBody: Data? = nil
        
        if let params = webRequest.params {
            switch webRequest.encodingType {
            case .url:
                components.queryItems = try? URLQueryEncoder().encode(params)
            case .body:
                httpBody = try? JSONEncoder().encode(params)
            case .none:
                break
            }
        }
        
        guard let url = components.url else {
            return .failure(.buildURL)
        }
        
        var request = URLRequest(url: url, cachePolicy: cachePolicy, timeoutInterval: timeoutInterval)
        webRequest.headers?.forEach { request.setValue($0.value, forHTTPHeaderField: $0.field) }
        
        request.httpMethod = webRequest.httpMethod.rawValue
        request.httpBody = httpBody
        
        return .success(request)
    }
}
