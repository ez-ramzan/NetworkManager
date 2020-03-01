//
//  WebServiceConfigurationProtocol.swift
//  Currency Rates
//
//  Created by Raman Liulkovich on 9/24/19.
//  Copyright © 2019 Raman Liulkovich. All rights reserved.
//

import Foundation

///Protocol for implementation web service configuration.

public protocol WebServiceConfigurationProtocol {
    
    ///Web url for request.
    var url: URL { get }
    
    ///HTTP headers for every request through this web service.
    var headers: [HTTPHeader]? { get }
    
    ///Type of cache policy.
    var cachePolicy: URLRequest.CachePolicy { get }
    
    ///Max  response timeout.
    var timeout: TimeInterval { get }
}
