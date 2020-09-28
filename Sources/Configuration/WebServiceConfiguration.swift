//
//  WebServiceConfiguration.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/24/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Object for main settings web service.

public final class WebServiceConfiguration: WebServiceConfigurationProtocol {
    
    public var url: URL
    public var headers: [HTTPHeader]?
    public var cachePolicy: URLRequest.CachePolicy
    public var timeout: TimeInterval
    
    public init(url: URL, headers: [HTTPHeader]? = nil, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60) {
        self.url = url
        self.headers = headers
        self.cachePolicy = cachePolicy
        self.timeout = timeout
    }
}
