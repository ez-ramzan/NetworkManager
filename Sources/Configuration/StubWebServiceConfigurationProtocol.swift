//
//  StubWebServiceConfigurationProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 12/16/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation stub web service configuration.

public protocol StubWebServiceConfigurationProtocol {
    
    ///Web url for stub request.
    var url: URL { get }
    
    ///Stub provider for getting StubResponseData.
    var provider: StubProviderProtocol { get }
    
    ///Type of cache policy.
    var cachePolicy: URLRequest.CachePolicy { get }
    
    ///Max response timeout.
    var timeout: TimeInterval { get }
}
