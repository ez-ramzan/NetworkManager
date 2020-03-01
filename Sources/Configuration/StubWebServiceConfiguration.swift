//
//  StubWebServiceConfiguration.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 12/13/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Object for main settings stub web service.

public final class StubWebServiceConfiguration: StubWebServiceConfigurationProtocol {
    
    public var url: URL
    public var provider: StubProviderProtocol
    public var cachePolicy: URLRequest.CachePolicy
    public var timeout: TimeInterval
    
    init(url: URL, provider: StubProviderProtocol, cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy, timeout: TimeInterval = 60) {
        self.url = url
        self.provider = provider
        self.cachePolicy = cachePolicy
        self.timeout = timeout
    }
}
